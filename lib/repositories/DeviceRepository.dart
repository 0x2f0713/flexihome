import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flexihome/models/Device.dart';

class CreateDeviceFailure implements Exception {}

class GetDeviceFailure implements Exception {}

class DeviceRepository {
  DeviceRepository(
      {CollectionReference? collectionReference, required String houseId})
      : _collectionReference = collectionReference ??
            FirebaseFirestore.instance
                .collection("houses")
                .doc(houseId)
                .collection("devices"),
        _houseId = houseId;
  final CollectionReference _collectionReference;
  final String _houseId;
  Future<DocumentReference> createDevice(Device device) async {
    try {
      return await _collectionReference.add(Device);
    } on Exception {
      throw CreateDeviceFailure();
    }
  }

  Future<List<Device>> index() async {
    try {
      print(_houseId);
      QuerySnapshot<Object?> response = await _collectionReference.get();
      return response.docs
          .map<Device>((e) => Device.fromQuerySnapshot(e))
          .toList();
    } on Exception {
      throw GetDeviceFailure();
    }
  }
}
