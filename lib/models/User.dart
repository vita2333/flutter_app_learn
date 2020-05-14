/// login : "octocat"
/// avatar_url : "https://github.com/images/error/octocat_happy.gif"
/// type : "User"
/// name : "monalisa octocat"
/// company : "GitHub"
/// blog : "https://github.com/blog"
/// location : "San Francisco"
/// email : "octocat@github.com"
/// hireable : false
/// bio : "There once was..."
/// public_repos : 2
/// followers : 20
/// following : 0
/// created_at : "2008-01-14T04:33:35Z"
/// updated_at : "2008-01-14T04:33:35Z"
/// total_private_repos : 100
/// owned_private_repos : 100

class User {
  String _login;
  String _avatarUrl;
  String _type;
  String _name;
  String _company;
  String _blog;
  String _location;
  String _email;
  bool _hireable;
  String _bio;
  int _publicRepos;
  int _followers;
  int _following;
  String _createdAt;
  String _updatedAt;
  int _totalPrivateRepos;
  int _ownedPrivateRepos;

  String get login => _login;
  String get avatarUrl => _avatarUrl;
  String get type => _type;
  String get name => _name;
  String get company => _company;
  String get blog => _blog;
  String get location => _location;
  String get email => _email;
  bool get hireable => _hireable;
  String get bio => _bio;
  int get publicRepos => _publicRepos;
  int get followers => _followers;
  int get following => _following;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get totalPrivateRepos => _totalPrivateRepos;
  int get ownedPrivateRepos => _ownedPrivateRepos;

  User(
      this._login,
      this._avatarUrl,
      this._type,
      this._name,
      this._company,
      this._blog,
      this._location,
      this._email,
      this._hireable,
      this._bio,
      this._publicRepos,
      this._followers,
      this._following,
      this._createdAt,
      this._updatedAt,
      this._totalPrivateRepos,
      this._ownedPrivateRepos);

  User.map(dynamic obj) {
    this._login = obj["login"];
    this._avatarUrl = obj["avatarUrl"];
    this._type = obj["type"];
    this._name = obj["name"];
    this._company = obj["company"];
    this._blog = obj["blog"];
    this._location = obj["location"];
    this._email = obj["email"];
    this._hireable = obj["hireable"];
    this._bio = obj["bio"];
    this._publicRepos = obj["publicRepos"];
    this._followers = obj["followers"];
    this._following = obj["following"];
    this._createdAt = obj["createdAt"];
    this._updatedAt = obj["updatedAt"];
    this._totalPrivateRepos = obj["totalPrivateRepos"];
    this._ownedPrivateRepos = obj["ownedPrivateRepos"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["login"] = _login;
    map["avatarUrl"] = _avatarUrl;
    map["type"] = _type;
    map["name"] = _name;
    map["company"] = _company;
    map["blog"] = _blog;
    map["location"] = _location;
    map["email"] = _email;
    map["hireable"] = _hireable;
    map["bio"] = _bio;
    map["publicRepos"] = _publicRepos;
    map["followers"] = _followers;
    map["following"] = _following;
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    map["totalPrivateRepos"] = _totalPrivateRepos;
    map["ownedPrivateRepos"] = _ownedPrivateRepos;
    return map;
  }
}
