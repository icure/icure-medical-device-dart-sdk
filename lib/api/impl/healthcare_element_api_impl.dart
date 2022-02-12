import 'package:icure_dart_sdk/extended_api/health_element_api.dart';
import 'package:icure_dart_sdk/extended_api/health_element_api.dart';
import 'package:icure_dart_sdk/extended_api/health_element_api.dart';
import 'package:icure_dart_sdk/extended_api/health_element_api.dart';
import 'package:icure_dart_sdk/extended_api/health_element_api.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_dart_sdk/crypto/crypto.dart';
import 'package:icure_medical_device_dart_sdk/medtech_api.dart';
import 'package:icure_medical_device_dart_sdk/mappers/healthcare_element.dart';
import 'package:uuid/uuid.dart';



class HealthcareElementApiImpl extends HealthcareElementApi{
  final MedTechApi api;

  HealthcareElementApiImpl(this.api);

  @override
  Future<HealthcareElement?> createOrModifyHealthcareElement(HealthcareElement healthcareElement) async {
    final localCrypto = api.localCrypto;
    final currentUser = await api.userApi.getCurrentUser();
    final ccHealthElement = healthElementCryptoConfig(localCrypto);

    if(currentUser == null){
      throw StateError("Couldn't get current user");
    }

    if(healthcareElement.rev != null) {
      if(healthcareElement.id == null || !Uuid.isValidUUID(fromString: healthcareElement.id!)){
        throw ArgumentError("Update id should be provided as an UUID");
      }
      final modifiedHealthElementDto = await HealthElementApiCrypto(api.healthElementApi).modifyHealthElement(currentUser, HealthcareElementMapper(healthcareElement).toHealthElementDto(), ccHealthElement);
      return modifiedHealthElementDto != null ? HealthElementDtoMapper(modifiedHealthElementDto).toHealthcareElement() : null;
    }
    final createdHealthElementDto = await HealthElementApiCrypto(api.healthElementApi).createHealthElement(currentUser, HealthcareElementMapper(healthcareElement).toHealthElementDto(), ccHealthElement);
    return createdHealthElementDto != null ? HealthElementDtoMapper(createdHealthElementDto).toHealthcareElement() : null;
  }

  @override
  Future<List<HealthcareElement>?> createOrModifyHealthcareElements(List<HealthcareElement> healthcareElement) {
    // TODO: implement createOrModifyHealthcareElements
    throw UnimplementedError();
  }

  @override
  Future<String?> deleteHealthcareElement(String id) {
    // TODO: implement deleteHealthcareElement
    throw UnimplementedError();
  }

  @override
  Future<PaginatedListHealthcareElement?> filterHealthcareElement(Filter filter) {
    // TODO: implement filterHealthcareElement
    throw UnimplementedError();
  }

  @override
  Future<HealthcareElement?> getHealthcareElement(String id) {
    // TODO: implement getHealthcareElement
    throw UnimplementedError();
  }

  @override
  Future<List<String>?> matchHealthcareElement(Filter filter) {
    // TODO: implement matchHealthcareElement
    throw UnimplementedError();
  }

}
