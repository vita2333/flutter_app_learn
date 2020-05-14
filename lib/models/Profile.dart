/// user : "$user"
/// token : ""
/// theme : 5678
/// cache : "$cacheConfig"
/// lastLogin : ""
/// locale : ""

class Profile {
  String _user;
  String _token;
  int _theme;
  String _cache;
  String _lastLogin;
  String _locale;

  String get user => _user;
  String get token => _token;
  int get theme => _theme;
  String get cache => _cache;
  String get lastLogin => _lastLogin;
  String get locale => _locale;

  Profile(this._user, this._token, this._theme, this._cache, this._lastLogin,
      this._locale);

  Profile.map(dynamic obj) {
    this._user = obj["user"];
    this._token = obj["token"];
    this._theme = obj["theme"];
    this._cache = obj["cache"];
    this._lastLogin = obj["lastLogin"];
    this._locale = obj["locale"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["user"] = _user;
    map["token"] = _token;
    map["theme"] = _theme;
    map["cache"] = _cache;
    map["lastLogin"] = _lastLogin;
    map["locale"] = _locale;
    return map;
  }
}
