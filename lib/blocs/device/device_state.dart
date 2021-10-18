part of 'device_bloc.dart';

class DeviceState extends Equatable {
  DeviceRepository _deviceRepository;
  List<Device>? _deviceList;
  String _msg;
  String get msg => _msg;
  List<Device>? get deviceList => _deviceList;
  DeviceState(
      DeviceRepository deviceRepository, List<Device>? deviceList, String msg)
      : _deviceRepository = deviceRepository,
        _deviceList = deviceList,
        _msg = msg;

  @override
  List<List<Device>?> get props => [_deviceList];
}

class DeviceLoading extends DeviceState {
  DeviceLoading(
      DeviceRepository deviceRepository, List<Device>? deviceList, String msg)
      : super(deviceRepository, deviceList, msg);
}

class DeviceLoaded extends DeviceState {
  DeviceLoaded(
      DeviceRepository deviceRepository, List<Device>? deviceList, String msg)
      : super(deviceRepository, deviceList, msg);
}

class DeviceError extends DeviceState {
  DeviceError(
      DeviceRepository deviceRepository, List<Device>? deviceList, String msg)
      : super(deviceRepository, deviceList, msg);
}
