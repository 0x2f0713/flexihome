import 'package:flexihome/blocs/device/device_bloc.dart';
import 'package:flexihome/models/Device.dart';
import 'package:flexihome/pages/controller/DeviceControllerPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceList extends StatefulWidget {
  final String _houseId;
  const DeviceList({Key? key, required String houseId})
      : _houseId = houseId,
        super(key: key);

  @override
  _DeviceListState createState() => _DeviceListState();
}

class _DeviceListState extends State<DeviceList> {
  late final DeviceBloc _deviceBloc = DeviceBloc(widget._houseId);
  @override
  void initState() {
    _deviceBloc.add(DeviceListGet());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _deviceBloc,
      child: BlocBuilder<DeviceBloc, DeviceState>(
        builder: (context, state) {
          if (state is DeviceLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DeviceLoaded) {
            return _buildDeviceList(state.deviceList);
          }
          return Center(
            child: Text(state.msg),
          );
        },
      ),
    );
  }

  Widget _buildDeviceList(List<Device>? deviceList) {
    if (deviceList!.isEmpty) {
      return Center(
        child: Text("Bạn chưa có thiết bị nào\nHãy liên hệ quản trị viên"),
      );
    }
    return ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: deviceList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.house),
            title: Text(deviceList[index].name),
            onTap: () => Navigator.of(context)
                .push<void>(DeviceControllerPage.route(deviceList[index])),
          );
        });
  }
}
