import 'package:flutter/material.dart';

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
    return Text('body');
  }
}
