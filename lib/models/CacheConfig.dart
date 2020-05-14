/// enable : true
/// maxAge : 1000
/// maxCount : 100

class CacheConfig {
  bool _enable;
  int _maxAge;
  int _maxCount;

  bool get enable => _enable;
  int get maxAge => _maxAge;
  int get maxCount => _maxCount;

  CacheConfig(this._enable, this._maxAge, this._maxCount);

  CacheConfig.map(dynamic obj) {
    this._enable = obj["enable"];
    this._maxAge = obj["maxAge"];
    this._maxCount = obj["maxCount"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["enable"] = _enable;
    map["maxAge"] = _maxAge;
    map["maxCount"] = _maxCount;
    return map;
  }
}
