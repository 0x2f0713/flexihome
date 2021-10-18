part of 'house_bloc.dart';

abstract class HouseEvent extends Equatable {
  const HouseEvent();

  @override
  List<Object> get props => [];
}

class HouseListGet extends HouseEvent {}

class HouseCreate extends HouseEvent {}
