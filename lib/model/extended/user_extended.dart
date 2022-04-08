//
// @dart=2.12

part of icure_medical_device_dart_sdk.api;

extension UserExtended on User {
  String? dataOwnerId() {
    return this.healthcarePartyId ?? this.patientId ?? this.deviceId;
  }
}