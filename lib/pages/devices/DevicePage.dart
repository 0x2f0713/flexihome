import 'package:flexihome/blocs/signup/signup_state.dart';
import 'package:flexihome/pages/devices/DeviceList.dart';
import 'package:flexihome/pages/signup/SignUpForm.dart';
import 'package:flexihome/repositories/AuthenticationRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevicePage extends StatelessWidget {
  final String _title;
  final String _id;
  const DevicePage({Key? key, required String title, required String id})
      : _title = title,
        _id = id,
        super(key: key);

  static Route route(String title, String id) {
    return MaterialPageRoute<void>(
        builder: (_) => DevicePage(
              title: title,
              id: id,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      body: DeviceList(
        houseId: _id,
      ),
    );
  }
}
