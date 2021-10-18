import 'package:cloud_firestore/cloud_firestore.dart';

class Device {
  late List<Button> buttons;
  late String description;
  late String deviceName;
  late String name;
  late String id;

  Device(
      {required this.buttons,
      required this.description,
      required this.deviceName,
      required this.name,
      required this.id});

  Device.fromQuerySnapshot(QueryDocumentSnapshot<Object?> data) {
    Map<String, dynamic> map = data.data()! as Map<String, dynamic>;
    if (data['buttons'] != null) {
      // ignore: deprecated_member_use
      buttons =
          List<Button>.from(data["buttons"].map((e) => Button.fromdata(e)));
      // data['button'].forEach((v) {
      //   button.add(new Button.fromdata(v));
      // });
    }
    description = data['description'];
    deviceName = data['device_name'];
    name = data['name'];
    id = data.id;
  }

  Map<String, dynamic> todata() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.buttons != null) {
      data['button'] = this.buttons.map((v) => v.todata()).toList();
    }
    data['description'] = this.description;
    data['device_name'] = this.deviceName;
    data['name'] = this.name;
    return data;
  }
}

class Button {
  late int icon;
  late String name;
  late String pin;
  late ButtonState state;
  late int type;

  Button(
      {required this.icon,
      required this.name,
      required this.pin,
      required this.state,
      required this.type});

  Button.fromdata(Map<String, dynamic> data) {
    icon = data['icon'];
    name = data['name'];
    pin = data['pin'];
    state = (data['state'] != null
        ? new ButtonState.fromdata(data['state'])
        : null)!;
    type = data['type'];
  }

  Map<String, dynamic> todata() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['name'] = this.name;
    data['pin'] = this.pin;
    if (this.state != null) {
      data['state'] = this.state.todata();
    }
    data['type'] = this.type;
    return data;
  }
}

class ButtonState {
  late int off;
  late int on;

  ButtonState({required this.off, required this.on});

  ButtonState.fromdata(Map<String, dynamic> data) {
    off = data['off'];
    on = data['on'];
  }

  Map<String, dynamic> todata() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['off'] = this.off;
    data['on'] = this.on;
    return data;
  }
}
