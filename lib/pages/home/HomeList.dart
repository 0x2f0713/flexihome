import 'package:flexihome/blocs/house/house_bloc.dart';
import 'package:flexihome/models/House.dart';
import 'package:flexihome/pages/devices/DevicePage.dart';
import 'package:flexihome/repositories/HouseRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: BlocListener<HouseBloc, HouseState>(
          listener: (context, state) {
            if (state is HouseError) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.msg),
                ),
              );
            }
          },
          child: BlocBuilder<HouseBloc, HouseState>(
            builder: (context, state) {
              if (state is HouseLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HouseLoaded) {
                return _buildHouseList(state.houseList);
              }
              return Center(
                child: Text(state.msg),
              );
            },
          ),
        ),
        onRefresh: () {
          final houseBloc = BlocProvider.of<HouseBloc>(context)
            ..add(HouseListGet());
          return houseBloc.stream.firstWhere((e) => e is! HouseListGet);
        });
  }

  Widget _buildHouseList(List<House>? houseList) {
    if (houseList!.isEmpty) {
      return Center(
        child: Text("Bạn chưa có ngôi nhà nào\nHãy tạo một ngôi nhà mới"),
      );
    }
    return ListView.builder(
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: houseList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.house),
            title: Text(houseList[index].name),
            onTap: () => Navigator.of(context).push<void>(
                DevicePage.route(houseList[index].name, houseList[index].id)),
          );
        });
  }
}
