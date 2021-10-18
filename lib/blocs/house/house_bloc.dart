import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flexihome/models/House.dart';
import 'package:flexihome/repositories/HouseRepository.dart';

part 'house_event.dart';
part 'house_state.dart';

class HouseBloc extends Bloc<HouseEvent, HouseState> {
  final String _uid;
  String get uid => _uid;
  HouseRepository _houseRepository = HouseRepository();
  HouseBloc(String uid)
      : _uid = uid,
        _houseRepository = HouseRepository(uid: uid),
        super(HouseState(null, null, "Not loaded")) {
    on<HouseListGet>((event, emit) async {
      emit(HouseLoading(_houseRepository, null, "Loading"));
      await _houseRepository
          .index()
          .then((value) => emit(HouseLoaded(_houseRepository, value, "Loaded")))
          .onError((error, stackTrace) =>
              emit(HouseError(_houseRepository, null, "Error")));
    });
    on<HouseCreate>((event, emit) {
      // TODO: implement event handler
    });
  }
}
