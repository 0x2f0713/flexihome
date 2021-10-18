import 'package:flexihome/blocs/devicecontroller/devicecontroller_bloc.dart';
import 'package:flexihome/models/Device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class DeviceController extends StatelessWidget {
  const DeviceController({Key? key, required Device device})
      : _device = device,
        super(key: key);
  final Device _device;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DevicecontrollerBloc, DevicecontrollerState>(
      builder: (context, state) {
        return ListView.builder(
          padding: EdgeInsets.all(5.h),
          itemCount: _device.buttons.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.fromLTRB(0.w, 1.h, 0.w, 1.h),
              child: RaisedButton(
                onPressed: () => print('onPressed'),
                child: SizedBox(
                  width: double.infinity,
                  child: GestureDetector(
                    onTapDown: (_) => context
                        .read<DevicecontrollerBloc>()
                        .add(ButtonSetHigh(index: index)),
                    onTapUp: (_) => context
                        .read<DevicecontrollerBloc>()
                        .add(ButtonSetLow(index: index)),
                    onTapCancel: () => context
                        .read<DevicecontrollerBloc>()
                        .add(ButtonSetLow(index: index)),
                    child: Container(
                      height: 20.h,
                      width: double.infinity,
                      child: Text(
                        _device.buttons[index].name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 9.h,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
