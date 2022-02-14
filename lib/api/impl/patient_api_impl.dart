import 'package:icure_dart_sdk/api.dart' as iCureApi;
import 'package:icure_dart_sdk/crypto/crypto.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/medtech_api.dart';
import 'package:icure_medical_device_dart_sdk/mappers/patient.dart';
import 'package:icure_medical_device_dart_sdk/mappers/paginated_list.dart';
import 'package:icure_medical_device_dart_sdk/mappers/filter.dart';
import 'package:uuid/uuid.dart';

class PatientApiImpl extends PatientApi {
  final MedTechApi api;

  PatientApiImpl(this.api);

  @override
  Future<Patient?> createOrModifyPatient(Patient patient) async {
    final localCrypto = api.localCrypto;
    final currentUser = await api.userApi.getCurrentUser();
    final ccPatient = patientCryptoConfig(localCrypto);

    if (currentUser == null) {
      throw StateError("Couldn't get current user");
    }

    if (patient.rev != null) {
      if (patient.id == null || !Uuid.isValidUUID(fromString: patient.id!)) {
        throw ArgumentError("Update id should be provided as an UUID");
      }
      final modifiedPatientDto =
          await iCureApi.PatientApiCrypto(api.patientApi).modifyPatient(currentUser, PatientMapper(patient).toPatientDto(), ccPatient);
      return modifiedPatientDto != null ? PatientDtoMapper(modifiedPatientDto).toPatient() : null;
    }
    final createdPatientDto =
        await iCureApi.PatientApiCrypto(api.patientApi).createPatient(currentUser, PatientMapper(patient).toPatientDto(), ccPatient);
    return createdPatientDto != null ? PatientDtoMapper(createdPatientDto).toPatient() : null;
  }

  @override
  Future<String?> deletePatient(String patientId) {
    throw UnimplementedError();
  }

  @override
  Future<PaginatedListPatient?> filterPatients(Filter filter, {String? nextPatientId, int? limit, String? startKey}) async {
    final localCrypto = api.localCrypto;
    final currentUser = await api.userApi.getCurrentUser();
    final ccPatient = patientCryptoConfig(localCrypto);

    return (await iCureApi.PatientApiCrypto(api.patientApi).filterPatientsBy(currentUser!, iCureApi.FilterChain<iCureApi.PatientDto>(filter.toAbstractFilterDto()), startKey, nextPatientId, limit, ccPatient))
        ?.toPaginatedListPatient();
  }

  @override
  Future<Patient?> getPatient(String patientId) async => await PatientDtoMapper(await api.patientApi.getPatient(
          (await api.userApi.getCurrentUser() ?? (throw StateError("Couldn't get current user"))), patientId, patientCryptoConfig(api.localCrypto)))
      ?.toPatient();

  @override
  Future<List<String>?> matchPatients(Filter filter) {
    return api.patientApi.rawMatchPatientsBy(filter.toAbstractFilterDto());
  }
}
