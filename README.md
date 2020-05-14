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
