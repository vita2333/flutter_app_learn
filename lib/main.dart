import 'package:flutter/material.dart';
import 'package:flutter_app_learn/common/Global.dart';
import 'package:flutter_app_learn/routes/HomePage.dart';
import 'package:flutter_app_learn/routes/LoginPage.dart';
import 'package:flutter_app_learn/routes/ThemeChangePage.dart';
import 'package:flutter_app_learn/states/ProfileChangeNotifier.dart';
import 'package:provider/provider.dart';

void main() => Global.init().then((value) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //我们的根widget是MultiProvider，它将主题、用户、语言三种状态绑定到了应用的根上，如此一来，任何路由中都可以通过Provider
    // .of()来获取这些状态，也就是说这三种状态是全局共享的！
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: LocaleModel()),
      ],
      child: Consumer2<ThemeModel, LocaleModel>(
        builder: (BuildContext context, themeModel, localeModel, Widget child) {
          return MaterialApp(
            theme: ThemeData(primarySwatch: themeModel.theme),
            home: HomeRoute(),
            locale: localeModel.getLocale(),
            routes: {
              'login': (context) => LoginRoute(),
              'themes': (context) => ThemeChangeRoute(),
            },
          );
        },
      ),
    );
  }
}
