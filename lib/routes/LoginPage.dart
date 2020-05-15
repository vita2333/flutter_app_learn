import 'package:flutter/material.dart';
import 'package:flutter_app_learn/common/Api.dart';
import 'package:flutter_app_learn/common/Func.dart';
import 'package:flutter_app_learn/common/Global.dart';
import 'package:flutter_app_learn/models/user.dart';
import 'package:flutter_app_learn/states/ProfileChangeNotifier.dart';
import 'package:provider/provider.dart';

class LoginRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginRouteState();
  }
}

class _LoginRouteState extends State<LoginRoute> {
  var _unameController = new TextEditingController();
  var _pwdController = new TextEditingController();
  bool pwdShow = false;
  bool _nameAutoFocus = true;
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
    _unameController.text = Global.profile.lastLogin;
    if (_unameController.text.isNotEmpty) {
      _nameAutoFocus = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: _nameAutoFocus,
                controller: _unameController,
                decoration: InputDecoration(
                    labelText: 'username',
                    hintText: 'username or email',
                    prefixIcon: Icon(Icons.person)),
                validator: (v) {
                  return v.trim().isNotEmpty ? null : 'username required';
                },
              ),
              TextFormField(
                autofocus: !_nameAutoFocus,
                controller: _pwdController,
                decoration: InputDecoration(
                    labelText: 'password',
                    hintText: 'password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                        icon: Icon(
                            pwdShow ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            pwdShow = !pwdShow;
                          });
                        })),
                obscureText: !pwdShow,
                validator: (v) {
                  return v.trim().isNotEmpty ? null : 'password required';
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 55),
                  child: RaisedButton(
                    onPressed: _onLogin,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Text('login'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() async {
    // 提交前，先验证各个表单字段是否合法
    if ((_formKey.currentState as FormState).validate()) {
      showLoading(context);
      User user;
      try {
        user = await GitHub(context)
            .login(_unameController.text, _pwdController.text);
        // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
        Provider.of<UserModel>(context, listen: false).user = user;
      } catch (e) {
        if (e.response?.statusCode == 401) {
          showToast('username or password wrong');
        } else {
          print(e.toString());

          showToast(e.toString());
        }
      } finally {
        Navigator.of(context).pop();
      }
      if (user != null) {
        Navigator.of(context).pop();
      }
    }
  }
}
