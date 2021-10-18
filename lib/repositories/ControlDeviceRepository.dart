import 'package:firebase_database/firebase_database.dart';
import 'package:flexihome/models/Device.dart';

class ControlDeviceRepository {
  DatabaseReference _databaseReference;
  Device device;
  ControlDeviceRepository(
      {DatabaseReference? databaseReference, required this.device})
      : _databaseReference =
            databaseReference ?? FirebaseDatabase().reference();
  void setLow(int index) {
    _databaseReference
        .child(device.id)
        .child("buttons")
        .child(device.buttons[index].pin)
        .update({"value": device.buttons[index].state.off});
  }

  void setHigh(int index) {
    _databaseReference
        .child(device.id)
        .child("buttons")
        .child(device.buttons[index].pin)
        .update({"value": device.buttons[index].state.on});
  }
}
