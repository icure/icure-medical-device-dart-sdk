//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

abstract class AuthenticationApi {
  /**
   * Starts the authentication of a user by sending him/her a validation code by email and/or mobile phone.
   * Use this service if you would like to sign-up or login your user
   *
   * ## Parameters:
   *  - [healthcareProfessionalId] The id of the healthcare professional that wants to invite the user for its authentication. Use the id of the hcp in charge of the database where you want to add this new user
   *  - [firstName] The firstname of the user to authenticate
   *  - [lastName] The lastname of the user to authenticate
   *  - [recaptcha] The recaptcha key used during authentication process
   *  - [bypassTokenCheck] Prevent the token check during the validation process
   *  - [email] The email of the user to authenticate
   *  - [mobilePhone] The mobile phone of the user to authenticate
   *
   * ## Returns
   *  - The [AuthenticationProcess] information needed to complete the authentication in the [completeAuthentication] service
   */
  Future<AuthenticationProcess> startAuthentication(
      String healthcareProfessionalId, String firstName, String lastName, String recaptcha, bool bypassTokenCheck,
      {String? email, String? mobilePhone});

  /**
   * Completes the authentication process of a user, by verifying the provided validation code and :
   * - In the case of a sign-up, create the user data;
   * - In the case of a login, re-generate keys if needed (new keys different from previous ones);
   *
   * ## Parameters
   * - [process] The [AuthenticationProcess] previously provided in the [startAuthentication] service
   * - [validationCode] The validation code the user received by email/mobile phone
   * - [userKeyPair] The key pair [private, public] that will be used by the user to encrypt/decrypt data;
   * - [tokenAndKeyPairProvider] A custom function to generate an authentication token and a key pair for user
   *
   * ## Returns
   * - The result of the authentication and the related MedTechApi object corresponding to the newly authenticated
   * user.
   */
  Future<AuthenticationResult> completeAuthentication(AuthenticationProcess process, String validationCode, Tuple2<String, String> userKeyPair,
      Future<Tuple3<String, String, String>?> Function(String, String) tokenAndKeyPairProvider);
}
