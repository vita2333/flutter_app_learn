import 'package:flutter/material.dart';
import 'package:flutter_app_learn/states/ProfileChangeNotifier.dart';
import 'package:flutter_app_learn/widgets/RepoItem.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //移除顶部padding
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[_buildHeader(), Expanded(child: _buildMenus())],
          )),
    );
  }

  Widget _buildHeader() {
    return Consumer<UserModel>(
        builder: (BuildContext context, UserModel value, Widget child) {
      return GestureDetector(
        child: Container(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.only(top: 40, bottom: 30),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipOval(
                  // 如果已登录，则显示用户头像；若未登录，则显示默认头像
                  child: value.isLogin
                      ? gmAvatar(value.user.avatar_url, width: 80)
                      : Image.asset(
                          "imgs/avatar-default.png",
                          width: 80,
                        ),
                ),
              ),
              Text(
                value.isLogin ? value.user.login : 'login',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              )
            ],
          ),
        ),
        onTap: () {
          if (!value.isLogin) {
            Navigator.of(context).pushNamed('login');
          }
        },
      );
    });
  }

  Widget _buildMenus() {
    return Consumer<UserModel>(
      builder: (BuildContext context, UserModel userModel, Widget child) {
        return ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: Text('todo'),
              onTap: () => Navigator.pushNamed(context, 'themes'),
            ),
            if (userModel.isLogin)
              ListTile(
                leading: Icon(Icons.power_settings_new),
                title: Text('log out'),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        //退出账号前先弹二次确认窗
                        return AlertDialog(
                          content: Text('log out tip'),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('cancel')),
                            FlatButton(
                                onPressed: () {
                                  //该赋值语句会触发MaterialApp rebuild
                                  userModel.user = null;
                                  Navigator.pop(context);
                                },
                                child: Text('yes'))
                          ],
                        );
                      });
                },
              )
          ],
        );
      },
    );
  }
}
