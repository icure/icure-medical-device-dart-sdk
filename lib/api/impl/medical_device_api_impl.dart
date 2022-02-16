// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of icure_medical_device_dart_sdk.api;

class MedicalDeviceApiImpl extends MedicalDeviceApi {
  final MedTechApi api;

  MedicalDeviceApiImpl(this.api);

  @override
  Future<MedicalDevice?> createOrModifyMedicalDevice(MedicalDevice medicalDevice) async {
    return (await createOrModifyMedicalDevices([medicalDevice].toList()))?.single;
  }

  @override
  Future<List<MedicalDevice>?> createOrModifyMedicalDevices(List<MedicalDevice> medicalDevice) async {
    final medicalDevicesToCreate = medicalDevice.where((device) => device.rev == null).toSet();
    final medicalDevicesToUpdate = medicalDevice.toSet().difference(medicalDevicesToCreate);

    if (medicalDevicesToUpdate.any((element) => element.id == null || !Uuid.isValidUUID(fromString: element.id!))) {
      throw FormatException("Update id should be provided as an UUID");
    }

    final deviceToCreate = medicalDevicesToCreate.map((e) => MedicalDeviceMapper(e).toDeviceDto()).toList();
    final deviceToUpdate = medicalDevicesToUpdate.map((e) => MedicalDeviceMapper(e).toDeviceDto()).toList();

    final deviceCreated = await api.baseDeviceApi.createDevices(deviceToCreate);
    final deviceUpdated = await api.baseDeviceApi.updateDevices(deviceToUpdate);
    final deviceIdsProcessed = [...?deviceCreated, ...?deviceUpdated].map((e) => e.id!).toList();

    return (await api.baseDeviceApi.getDevices(base_api.ListOfIdsDto(ids: deviceIdsProcessed)))!.map((e) => DeviceDtoMapper(e).toMedicalDevice()).toList();
  }

  @override
  Future<String?> deleteMedicalDevice(String medicalDeviceId) async {
    return (await api.baseDeviceApi.deleteDevice(medicalDeviceId))?.rev ?? (throw StateError("Invalid medical device id"));
  }

  @override
  Future<List<String>?> deleteMedicalDevices(List<String> requestBody) async {
    return (await api.baseDeviceApi.deleteDevices(base_api.ListOfIdsDto(ids: requestBody)))?.map((e) => e.rev!).toList();
  }

  @override
  Future<PaginatedListMedicalDevice?> filterMedicalDevices(Filter<MedicalDevice> filter, {String? nextDeviceId, int? limit}) async {
    return (await api.baseDeviceApi.filterDevicesBy(base_api.FilterChain<base_api.DeviceDto>(filter.toAbstractFilterDto()), startDocumentId: nextDeviceId, limit: limit))
        ?.toPaginatedListMedicalDevice();
  }

  @override
  Future<MedicalDevice?> getMedicalDevice(String medicalDeviceId) async {
    return DeviceDtoMapper(await api.baseDeviceApi.getDevice(medicalDeviceId) ?? (throw ArgumentError("MedicalDevice not found"))).toMedicalDevice();
  }

  @override
  Future<List<String>?> matchMedicalDevices(Filter filter) {
    return api.baseDeviceApi.matchDevicesBy(filter.toAbstractFilterDto());
  }
}
