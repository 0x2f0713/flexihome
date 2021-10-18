import 'package:cloud_firestore/cloud_firestore.dart';

class House {
  late String _name;
  late String _id;

  House({required String name, required String id}) {
    this._name = name;
    this._id = id;
  }

  String get name => _name;
  set name(String name) => _name = name;

  String get id => _id;
  set id(String id) => _id = id;

  House.fromQuerySnapshot(QueryDocumentSnapshot<Object?> data) {
    Map<String, dynamic> map = data.data()! as Map<String, dynamic>;
    _name = map["houseName"];
    _id = map["houseId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    return data;
  }
}
