import 'package:flexihome/blocs/devicecontroller/devicecontroller_bloc.dart';
import 'package:flexihome/blocs/signup/signup_state.dart';
import 'package:flexihome/models/Device.dart';
import 'package:flexihome/pages/controller/DeviceControllerView.dart';
import 'package:flexihome/pages/signup/SignUpForm.dart';
import 'package:flexihome/repositories/AuthenticationRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceControllerPage extends StatelessWidget {
  const DeviceControllerPage({Key? key, required Device device})
      : _device = device,
        super(key: key);
  final Device _device;
  static Route route(Device device) {
    return MaterialPageRoute<void>(
        builder: (_) => DeviceControllerPage(device: device));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_device.name)),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => DevicecontrollerBloc(device: _device),
          child: DeviceController(
            device: _device,
          ),
        ),
      ),
    );
  }
}
