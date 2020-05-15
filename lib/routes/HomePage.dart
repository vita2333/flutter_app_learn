import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/common/Api.dart';
import 'package:flutter_app_learn/models/repo.dart';
import 'package:flutter_app_learn/states/ProfileChangeNotifier.dart';
import 'package:flutter_app_learn/widgets/RepoItem.dart';
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

    return InfiniteListView<Repo>(
        onRetrieveData: (int page, List<Repo> items, bool refresh) async {
      var data = await GitHub(context)
          .getRepos({'page': page, 'page_size': 20}, refresh: refresh);
      items.addAll(data);
      // 如果接口返回的数量等于'page_size'，则认为还有数据，反之则认为最后一页
      return data.length == 20;
    }, itemBuilder: (List list, int index, BuildContext ctx) {
      return RepoItem(list[index]);
    });
  }
}
