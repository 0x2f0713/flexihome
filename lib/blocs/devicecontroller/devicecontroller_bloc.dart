import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flexihome/models/Device.dart';
import 'package:flexihome/repositories/ControlDeviceRepository.dart';

part 'devicecontroller_event.dart';
part 'devicecontroller_state.dart';

class DevicecontrollerBloc
    extends Bloc<DevicecontrollerEvent, DevicecontrollerState> {
  Device _device;
  ControlDeviceRepository _controlDeviceRepository;
  DevicecontrollerBloc({required Device device})
      : _device = device,
        _controlDeviceRepository = ControlDeviceRepository(device: device),
        super(DevicecontrollerInitial()) {
    on<ButtonSetHigh>((event, emit) {
      _controlDeviceRepository.setHigh(event.index);
      emit(PushButtonOnTapUp());
    });
    on<ButtonSetLow>((event, emit) {
      _controlDeviceRepository.setLow(event.index);
      emit(PushButtonOnTapDown());
    });
  }
}
