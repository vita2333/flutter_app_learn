import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter_app_learn/common/Global.dart';

class CacheObject {
  Response response;
  int timeStamp; // 缓存创建时间
  CacheObject(this.response)
      : timeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  bool operator ==(other) {
    return response.hashCode == other.hashCode;
  }

//将请求uri作为缓存的key
  @override
  int get hashCode => response.realUri.hashCode;
}

class NetCache extends Interceptor {
  // 为确保迭代器顺序和对象插入时间一致顺序一致，我们使用LinkedHashMap
  var cache = LinkedHashMap<String, CacheObject>();

  @override
  Future onRequest(RequestOptions options) async {
    if (!Global.profile.cache.enable) {
      return options;
    } // refresh标记是否是"下拉刷新"
    bool refresh = options.extra['refresh'] == true;
    print(options);
    //如果是下拉刷新，先删除相关缓存
    if (refresh) {
      if (options.extra['list'] == true) {
        //若是列表，则只要url中包含当前path的缓存全部删除（简单实现，并不精准）
        cache.removeWhere((key, value) => key.contains(options.path));
      } else {
        // 如果不是列表，则只删除uri相同的缓存
        delete(options.uri.toString());
      }
      return options;
    }

    if (options.extra['noCache'] != true &&
        options.method.toLowerCase() == 'get') {
      String key = options.extra['cacheKey'] ?? options.uri.toString();
      var ob = cache[key];
      if (ob != null) {
        //若缓存未过期，则返回缓存内容
        if ((DateTime.now().millisecondsSinceEpoch - ob.timeStamp) / 1000 <
            Global.profile.cache.maxAge) {
          return cache[key].response;
        }
        //若已过期则删除缓存，继续向服务器请求
        delete(key);
      }
    }
  }

  @override
  Future onError(DioError err) {
    // 错误状态不缓存
  }

  @override
  Future onResponse(Response response) async {
    if (Global.profile.cache.enable) {
      _saveCache(response);
    }
  }

  _saveCache(Response response) {
    RequestOptions options = response.request;

    if (options.extra['noCache'] != true &&
        options.method.toLowerCase() == 'get') {
      if (cache.length >= Global.profile.cache.maxCount) {
        cache.remove(cache[cache.keys.first]);
      }
      String key = options.extra['cacheKey'] ?? options.uri.toString();
      cache[key] = CacheObject(response);
    }
  }

  void delete(String key) {
    cache.remove(key);
  }
}
