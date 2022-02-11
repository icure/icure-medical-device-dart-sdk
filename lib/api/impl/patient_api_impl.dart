
import 'package:icure_dart_sdk/api.dart' as iCureApi;
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/medtech_api.dart';

class PatientApiImpl extends PatientApi {
  final MedTechApi api;

  PatientApiImpl(this.api);

  @override
  Future<Patient?> createOrModifyPatient(Patient patient) async {
    final localCrypto = api.localCrypto;
    final currentUser = await api.userApi.getCurrentUser();
    final ccPatient =

    // TODO: implement createOrModifyPatient
    throw UnimplementedError();
  }

  @override
  Future<String?> deletePatient(String patientId) {
    // TODO: implement deletePatient
    throw UnimplementedError();
  }

  @override
  Future<PaginatedListPatient?> filterPatients(Filter filter, {String? nextPatientId, int? limit}) {
    // TODO: implement filterPatients
    throw UnimplementedError();
  }

  @override
  Future<Patient?> getPatient(String patientId) {
    // TODO: implement getPatient
    throw UnimplementedError();
  }

  @override
  Future<List<String>?> matchPatients(Filter filter) {
    // TODO: implement matchPatients
    throw UnimplementedError();
  }
}
