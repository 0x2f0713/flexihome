import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flexihome/models/Device.dart';
import 'package:flexihome/repositories/DeviceRepository.dart';

part 'device_event.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final String _houseId;
  String get houseId => _houseId;
  late DeviceRepository _deviceRepository;
  DeviceBloc(String houseId)
      : _houseId = houseId,
        _deviceRepository = DeviceRepository(houseId: houseId),
        super(DeviceState(
            DeviceRepository(houseId: houseId), null, "Not loaded")) {
    on<DeviceListGet>((event, emit) async {
      emit(DeviceLoading(_deviceRepository, null, "Loading"));
      await _deviceRepository
          .index()
          .then(
              (value) => emit(DeviceLoaded(_deviceRepository, value, "Loaded")))
          .onError((error, stackTrace) =>
              emit(DeviceError(_deviceRepository, null, "Error")));
    });
    on<DeviceCreate>((event, emit) {
      // TODO: implement event handler
    });
  }
}
