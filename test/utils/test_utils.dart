import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:tuple/tuple.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class TestUtils {

  static Future<MedTechApi> medtechApi({String? iCureBackendUrl, String? userName, String? userPassword, String? userPrivKey, String? authProcessHcpId}) async {
    final api = MedTechApiBuilder.newBuilder()
        .withICureBasePath(iCureBackendUrl ?? Platform.environment["ICURE_URL"] ?? "https://kraken.icure.dev")
        .withUserName(userName ?? Platform.environment["HCP_1_USERNAME"]!)
        .withPassword(userPassword ?? Platform.environment["HCP_1_PASSWORD"]!)
        .withAuthServerUrl(Platform.environment["MSG_GTW_URL"])
        .withAuthProcessId(Platform.environment["PAT_AUTH_PROCESS_ID"])
        .build();

    final currentUser = await api.userApi.getLoggedUser();

    return MedTechApiBuilder.from(api)
        .addKeyPair(currentUser!.dataOwnerId()!, (userPrivKey ?? Platform.environment["HCP_1_PRIV_KEY"]!).keyFromHexString())
        .build();

  }

  static AnonymousMedTechApi anonymousMedtechApi({String? iCureUrl}) {
    return AnonymousMedTechApi(iCureUrl ?? Platform.environment["ICURE_URL"]!, Platform.environment["MSG_GTW_URL"]!, Platform.environment["PAT_AUTH_PROCESS_ID"]!);
  }

  static Future<AuthenticationResult> createAHcpUser(MedTechApi medTechApi) async {
    final Uuid uuid = Uuid();
    final userId = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});
    final userLogin = userId + '@icure.test';
    final userPassword = uuid.v4(options: {'rng': UuidUtil.cryptoRNG});
    final userKeyPair = generateRandomPrivateAndPublicKeyPair();

    final hcp = await medTechApi.healthcareProfessionalApi.createOrModifyHealthcareProfessional(
        HealthcareProfessional(firstName: 'Rob', lastName: 'Stark', systemMetaData: SystemMetaDataOwner(publicKey:userKeyPair.item2))
    );

    final user = await medTechApi.userApi.createOrModifyUser(User(login: userLogin, email: userLogin, passwordHash: userPassword, healthcarePartyId: hcp!.id));
    final newUserApi = MedTechApiBuilder.newBuilder()
        .withICureBasePath(medTechApi.iCureBasePath)
        .withUserName(userLogin)
        .withPassword(userPassword)
        .addKeyPair(hcp.id!, userKeyPair.item1.keyFromHexString())
        .build();

    return AuthenticationResult(newUserApi, userKeyPair, userPassword, user!.groupId!, user.id!);
  }

  static Future<AuthenticationResult> createAPatientUser(String userEmail, {String? iCureUrl}) async {
    final authProcessHcpId = Platform.environment["AUTH_PROCESS_HCP_ID"]!;
    final authRecaptcha = Platform.environment["AUTH_RECAPTCHA"] ?? "fake-recaptcha";

    final AnonymousMedTechApi api = anonymousMedtechApi(iCureUrl: iCureUrl);
    final AuthenticationApi authenticationApi = api.authenticationApi;

    // When
    final registrationProcess = await authenticationApi.startAuthentication(
        authProcessHcpId, "justin_th", "", authRecaptcha, false, email: userEmail);

    // Then
    final validationCode = (await TestUtils.getEmailFromMsgGtw(api.authServerUrl!, userEmail)).subject;
    final keyPair = generateRandomPrivateAndPublicKeyPair();

    Future<Tuple3<String, String, String>?> Function(String, String) tokenAndKeyPairProvider = (String groupId, String userId) async => null;

    // When
    return await authenticationApi.completeAuthentication(registrationProcess, validationCode, keyPair, tokenAndKeyPairProvider);
  }

  static Future<Uint8List> keyFromFile({String keyFileName = "782f1bcd-9f3f-408a-af1b-cd9f3f908a98-icc-priv.2048.key"}) async {
    var fileUri = Uri.file("test/resources/keys/${keyFileName}", windows: false);
    var keyFile = File.fromUri(fileUri);

    return (await keyFile.readAsString(encoding: utf8)).trim().keyFromHexString();
  }

  static Future<UsernamePassword> credentials({String credentialsFilePath = ".credentials"}) async {
    var fileUri = Uri.file("test/resources/creds/$credentialsFilePath", windows: false);
    var credentialsFile = File.fromUri(fileUri);

    return UsernamePassword.fromJson(json.decode(await credentialsFile.readAsString(encoding: utf8)))!;
  }

  static Future<MedTechApi> getApiFromCredentialsToken(
      {String credentialsFilePath = ".credentials",
        String authServer = "https://msg-gw.icure.cloud/km",
        String authProcessId = "f0ced6c6-d7cb-4f78-841e-2674ad09621e",
        String host = "https://kraken.icure.dev"}) async {
    final fileUri = Uri.file("test/resources/creds/$credentialsFilePath", windows: false);
    final credentialsFile = File.fromUri(fileUri);
    final user = UsernameTokenDataOwnerId.fromJson(json.decode(await credentialsFile.readAsString(encoding: utf8)));

    return MedTechApiBuilder()
        .withUserName(user!.username)
        .withPassword(user.token)
        .withAuthServerUrl(authServer)
        .withICureBasePath(host)
        .addKeyPair(user.dataOwnerId, await keyFromFile(keyFileName: "${user.dataOwnerId}-icc-priv.2048.key"))
        .build();
  }

  static AnonymousMedTechApi getAnonymousApi({String host = "https://kraken.icure.dev", String? authServer, String? authProcessId}) {
    return AnonymousMedTechApi(host, authServer, authProcessId);
  }

  static Future<EmailBody> getEmailFromMsgGtw(String msgGtwUrl, String email) async {
    final client = ApiClient(basePath: msgGtwUrl);

    Object? postBody;
    final response = await client.invokeAPI(
        "/lastEmail/${email}",
        'GET',
        <QueryParam>[],
        postBody,
        <String, String>{},
        <String, String>{},
        null,
        <String>[]
    );

    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return EmailBody.fromJson(jsonDecode(response.body))!;
    } else {
      throw Exception("Could not retrieve the email sent by the MSG-GTW");
    }
  }
}


class EmailBody {
  EmailBody({required this.from, required this.subject, this.html});

  String from;
  String subject;
  String? html;

  static EmailBody? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      return EmailBody(
          from: mapValueOfType<String>(json, r'from')!,
          subject: mapValueOfType<String>(json, r'subject')!,
          html: mapValueOfType<String>(json, r'html')
      );
    }
    return null;
  }
}

class UsernamePassword {
  UsernamePassword({required this.username, required this.password});

  String username;
  String password;

  static UsernamePassword? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      return UsernamePassword(username: mapValueOfType<String>(json, r'username')!, password: mapValueOfType<String>(json, r'password')!);
    }
    return null;
  }
}

class UsernameTokenDataOwnerId {
  String username;
  String token;
  String dataOwnerId;

  UsernameTokenDataOwnerId({required this.username, required this.token, required this.dataOwnerId});

  static UsernameTokenDataOwnerId? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      return UsernameTokenDataOwnerId(
          username: mapValueOfType<String>(json, r'username')!,
          token: mapValueOfType<String>(json, r'token')!,
          dataOwnerId: mapValueOfType<String>(json, r'dataOwnerId')!);
    }
    return null;
  }
}

class UserCreds {
  String hcpId;
  String login;
  String password;
  String privKey;

  UserCreds(this.hcpId, this.login, this.password, this.privKey);
}
