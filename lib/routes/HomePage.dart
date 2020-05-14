import 'package:flutter/material.dart';
import 'package:flutter_app_learn/states/ProfileChangeNotifier.dart';
import 'package:provider/provider.dart';

class HomeRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    UserModel userModel = Provider.of<UserModel>(context);
    if (!userModel.isLogin) {
      return Center(
        child: RaisedButton(
          child: Text('login'),
          onPressed: () => Navigator.of(context).pushNamed('login'),
        ),
      );
    }

    return Text(userModel.isLogin.toString());
  }
}
