part of 'device_bloc.dart';

abstract class DeviceEvent extends Equatable {
  const DeviceEvent();

  @override
  List<Object> get props => [];
}

class DeviceListGet extends DeviceEvent {}

class DeviceCreate extends DeviceEvent {}
