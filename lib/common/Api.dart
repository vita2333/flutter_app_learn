import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_learn/common/Global.dart';
import 'package:flutter_app_learn/models/index.dart';

class GitHub {
  BuildContext context;
  Options _options;

  GitHub([this.context]) : _options = Options(extra: {'context': context});
  static Dio dio = new Dio(BaseOptions(
    baseUrl: 'https://api.github.com/',
    headers: {
      HttpHeaders.acceptHeader: "application/vnd.github.squirrel-girl-preview,"
          "application/vnd.github.symmetra-preview+json",
    },
  ));

  static void init() {
    // 添加缓存插件
    dio.interceptors.add(Global.netCache);

    // 设置用户token（可能为null，代表未登录）
    dio.options.headers[HttpHeaders.authorizationHeader] = Global.profile.token;

    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    if (!Global.isRelease) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (uri) {
          return 'DIRECT';
        };
        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

// 登录接口，登录成功后返回用户信息
  Future<User> login(String login, String pwd) async {
    String basic = 'Basic ' + base64.encode(utf8.encode('$login:$pwd'));

    var r = await dio.get("/users/$login",
        options: _options.merge(headers: {
          HttpHeaders.authorizationHeader: basic
        }, extra: {
          'noCache': true, //本接口禁用缓存
        }));

    //登录成功后更新公共头（authorization），此后的所有请求都会带上用户身份信息
    dio.options.headers[HttpHeaders.authorizationHeader] = basic;
    Global.netCache.cache.clear();
    Global.profile.token = basic;
    return User.fromJson(r.data);
  }

  Future<List<Repo>> getRepos(Map<String, dynamic> queryParams,
      {refresh = false}) async {
    {
      if (refresh) {
        _options.extra.addAll({'refresh': true, 'list': true});
      }
      var r = await dio.get<List>(
        "user/repos",
        queryParameters: queryParams,
        options: _options,
      );
      return r.data.map((e) => Repo.fromJson(e)).toList();
    }
  }
}
