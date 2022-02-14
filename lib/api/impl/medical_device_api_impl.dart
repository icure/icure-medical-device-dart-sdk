import 'package:icure_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/api.dart';
import 'package:icure_medical_device_dart_sdk/mappers/filter.dart';
import 'package:icure_medical_device_dart_sdk/mappers/medical_device.dart';
import 'package:icure_medical_device_dart_sdk/mappers/paginated_list.dart';
import 'package:icure_medical_device_dart_sdk/medtech_api.dart';
import 'package:uuid/uuid.dart';

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

    final deviceCreated = await api.deviceApi.createDevices(deviceToCreate);
    final deviceUpdated = await api.deviceApi.updateDevices(deviceToUpdate);
    final deviceIdsProcessed = [...?deviceCreated, ...?deviceUpdated].map((e) => e.id!).toList();

    return (await api.deviceApi.getDevices(ListOfIdsDto(ids: deviceIdsProcessed)))!.map((e) => DeviceDtoMapper(e).toMedicalDevice()).toList();
  }

  @override
  Future<String?> deleteMedicalDevice(String medicalDeviceId) async {
    return (await api.deviceApi.deleteDevice(medicalDeviceId))?.rev ?? (throw StateError("Invalid medical device id"));
  }

  @override
  Future<List<String>?> deleteMedicalDevices(List<String> requestBody) async {
    return (await api.deviceApi.deleteDevices(ListOfIdsDto(ids: requestBody)))?.map((e) => e.rev!).toList();
  }

  @override
  Future<PaginatedListMedicalDevice?> filterMedicalDevices(Filter filter, {String? nextDeviceId, int? limit}) async {
    return (await api.deviceApi.filterDevicesBy(FilterChain<DeviceDto>(filter.toAbstractFilterDto()), startDocumentId: nextDeviceId, limit: limit))
        ?.toPaginatedListMedicalDevice();
  }

  @override
  Future<MedicalDevice?> getMedicalDevice(String medicalDeviceId) async {
    return DeviceDtoMapper(await api.deviceApi.getDevice(medicalDeviceId) ?? (throw ArgumentError("MedicalDevice not found"))).toMedicalDevice();
  }

  @override
  Future<List<String>?> matchMedicalDevices(Filter filter) {
    return api.deviceApi.matchDevicesBy(filter.toAbstractFilterDto());
  }
}
