part of 'devicecontroller_bloc.dart';

abstract class DevicecontrollerState extends Equatable {
  const DevicecontrollerState();

  @override
  List<Object> get props => [];
}

class DevicecontrollerInitial extends DevicecontrollerState {}

class PushButtonOnTapDown extends DevicecontrollerState {}

class PushButtonOnTapUp extends DevicecontrollerState {}
