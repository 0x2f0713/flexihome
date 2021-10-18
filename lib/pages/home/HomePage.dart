import 'package:flexihome/blocs/app/app_bloc.dart';
import 'package:flexihome/blocs/house/house_bloc.dart';
import 'package:flexihome/pages/home/HomeList.dart';
import 'package:flexihome/repositories/AuthenticationRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: HomePage());
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HouseBloc _houseBloc =
      HouseBloc(AuthenticationRepository().currentUser.id);

  @override
  void initState() {
    _houseBloc.add(HouseListGet());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocProvider.value(
        value: _houseBloc,
        child: HomeList(),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              // decoration: BoxDecoration(
              //   color: Colors.blue,
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlutterLogo(
                    size: 70,
                  ),
                  Text(user.name ?? ''),
                  Text(user.email ?? ''),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: const Text('Account'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log out"),
              onTap: () => context.read<AppBloc>().add(AppLogoutRequested()),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "New house",
        child: Icon(Icons.add),
        onPressed: () => _showDialog(),
      ),
    );
  }

  Future<String?> _showDialog() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Tên nhà mới'),
        content: TextFormField(
          decoration: InputDecoration(hintText: "VD: Nhà của Đốm,..."),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
