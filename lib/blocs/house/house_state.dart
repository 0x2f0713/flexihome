part of 'house_bloc.dart';

class HouseState extends Equatable {
  HouseRepository _houseRepository;
  List<House>? _houseList;
  String _msg;
  String get msg => _msg;
  List<House>? get houseList => _houseList;
  HouseState(
      HouseRepository? houseRepository, List<House>? houseList, String msg)
      : _houseRepository = houseRepository ?? HouseRepository(),
        _houseList = houseList,
        _msg = msg;

  @override
  List<List<House>?> get props => [_houseList];
}

class HouseLoading extends HouseState {
  HouseLoading(
      HouseRepository? houseRepository, List<House>? houseList, String msg)
      : super(houseRepository, houseList, msg);
}

class HouseLoaded extends HouseState {
  HouseLoaded(
      HouseRepository? houseRepository, List<House>? houseList, String msg)
      : super(houseRepository, houseList, msg);
}

class HouseError extends HouseState {
  HouseError(
      HouseRepository? houseRepository, List<House>? houseList, String msg)
      : super(houseRepository, houseList, msg);
}
