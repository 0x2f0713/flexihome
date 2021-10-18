import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flexihome/models/House.dart';

class CreateHouseFailure implements Exception {}

class GetHouseFailure implements Exception {}

class HouseRepository {
  HouseRepository({CollectionReference? collectionReference, String? uid})
      : _collectionReference = collectionReference ??
            FirebaseFirestore.instance.collection('junction_users_houses'),
        _uid = uid ?? "";
  final CollectionReference _collectionReference;
  final String _uid;
  Future<DocumentReference> createHouse(House house) async {
    try {
      return await _collectionReference.add(house);
    } on Exception {
      throw CreateHouseFailure();
    }
  }

  Future<List<House>> index() async {
    try {
      print(_uid);
      QuerySnapshot<Object?> response =
          await _collectionReference.where("userId", isEqualTo: _uid).get();
      return response.docs
          .map<House>((e) => House.fromQuerySnapshot(e))
          .toList();
    } on Exception {
      throw GetHouseFailure();
    }
  }
}
