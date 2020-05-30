# Flutter学习小记录


## 常用指令
```
rm ~/Documents/flutter/bin/cache/lockfile
flutter pub get
```



## json_model
```
flutter packages pub run json_model
```

```
flutter packages pub run build_runner build
```
这触发了一次性构建，我们可以在需要时为我们的Model生成json序列化代码，它通过我们的源文件，找出需要生成Model类的源文件（包含@JsonSerializable标注的）来生成对应的.g.dart文件。一个好的建议是将所有Model类放在一个单独的目录下，然后在该目录下执行命令。


### 目录结构
文件夹	作用
common	一些工具类，如通用方法类、网络接口类、保存全局变量的静态类等
l10n	国际化相关的类都在此目录下
models	Json文件对应的Dart Model类会在此目录下
states	保存APP中需要跨组件共享的状态类
routes	存放所有路由页面类
widgets	APP内封装的一些Widget组件都在该目录下


### Dart Model
处理json字符串,将Json "Model" 化
```json
{
  "name": "John Smith",
  "email": "john@example.com"
}
```
将json转换为List或Map
```dart
Map<String, dynamic> user = json.decode(user);
```
添加一个名为`User`的`Model Class`,包含:
- 一个User.fromJson 构造函数, 用于从一个map构造出一个 User实例 map structure
- 一个toJson 方法, 将 User 实例转化为一个map.
```dart
class User {
  
  // ...

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() =>
    <String, dynamic>{
      'name': name,
      'email': email,
    };

}
```
使用
```dart
Map userMap = json.decode(json);
var user = new User.fromJson(userMap);

print(user.name);
```
序列化
```dart
String json = json.encode(user);
// 不需要手动调用toJson这个方法，因为`JSON.encode内部会自动调用。
```

### 数据持久化
