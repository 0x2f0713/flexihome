part of 'devicecontroller_bloc.dart';

abstract class DevicecontrollerEvent extends Equatable {
  const DevicecontrollerEvent({required this.index});
  final int index;
  @override
  List<Object> get props => [];
}

class ButtonSetHigh extends DevicecontrollerEvent {
  ButtonSetHigh({required int index}) : super(index: index);
}

class ButtonSetLow extends DevicecontrollerEvent {
  ButtonSetLow({required int index}) : super(index: index);
}
