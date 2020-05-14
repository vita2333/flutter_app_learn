import 'package:flutter/material.dart';
import 'package:flutter_app_learn/common/Global.dart';

//void main() => Global.init().then((value) => runApp(MyApp()));
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Center(
          child: Text('data'),
        )
      ],
    );
  }
}
