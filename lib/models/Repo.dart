/// id : 1296269
/// name : "Hello-World"
/// full_name : "octocat/Hello-World"
/// owner : "$user"
/// parent : "$repo"
/// private : false
/// description : "This your first repo!"
/// fork : false
/// language : "JavaScript"
/// forks_count : 9
/// stargazers_count : 80
/// size : 108
/// default_branch : "master"
/// open_issues_count : 2
/// pushed_at : "2011-01-26T19:06:43Z"
/// created_at : "2011-01-26T19:01:12Z"
/// updated_at : "2011-01-26T19:14:43Z"
/// subscribers_count : 42
/// license : {"key":"mit","name":"MIT License","spdx_id":"MIT","url":"https://api.github.com/licenses/mit","node_id":"MDc6TGljZW5zZW1pdA=="}

class Repo {
  int _id;
  String _name;
  String _fullName;
  String _owner;
  String _parent;
  bool _private;
  String _description;
  bool _fork;
  String _language;
  int _forksCount;
  int _stargazersCount;
  int _size;
  String _defaultBranch;
  int _openIssuesCount;
  String _pushedAt;
  String _createdAt;
  String _updatedAt;
  int _subscribersCount;
  LicenseBean _license;

  int get id => _id;
  String get name => _name;
  String get fullName => _fullName;
  String get owner => _owner;
  String get parent => _parent;
  bool get private => _private;
  String get description => _description;
  bool get fork => _fork;
  String get language => _language;
  int get forksCount => _forksCount;
  int get stargazersCount => _stargazersCount;
  int get size => _size;
  String get defaultBranch => _defaultBranch;
  int get openIssuesCount => _openIssuesCount;
  String get pushedAt => _pushedAt;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get subscribersCount => _subscribersCount;
  LicenseBean get license => _license;

  Repo(
      this._id,
      this._name,
      this._fullName,
      this._owner,
      this._parent,
      this._private,
      this._description,
      this._fork,
      this._language,
      this._forksCount,
      this._stargazersCount,
      this._size,
      this._defaultBranch,
      this._openIssuesCount,
      this._pushedAt,
      this._createdAt,
      this._updatedAt,
      this._subscribersCount,
      this._license);

  Repo.map(dynamic obj) {
    this._id = obj["id"];
    this._name = obj["name"];
    this._fullName = obj["fullName"];
    this._owner = obj["owner"];
    this._parent = obj["parent"];
    this._private = obj["private"];
    this._description = obj["description"];
    this._fork = obj["fork"];
    this._language = obj["language"];
    this._forksCount = obj["forksCount"];
    this._stargazersCount = obj["stargazersCount"];
    this._size = obj["size"];
    this._defaultBranch = obj["defaultBranch"];
    this._openIssuesCount = obj["openIssuesCount"];
    this._pushedAt = obj["pushedAt"];
    this._createdAt = obj["createdAt"];
    this._updatedAt = obj["updatedAt"];
    this._subscribersCount = obj["subscribersCount"];
    this._license = obj["license"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["name"] = _name;
    map["fullName"] = _fullName;
    map["owner"] = _owner;
    map["parent"] = _parent;
    map["private"] = _private;
    map["description"] = _description;
    map["fork"] = _fork;
    map["language"] = _language;
    map["forksCount"] = _forksCount;
    map["stargazersCount"] = _stargazersCount;
    map["size"] = _size;
    map["defaultBranch"] = _defaultBranch;
    map["openIssuesCount"] = _openIssuesCount;
    map["pushedAt"] = _pushedAt;
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    map["subscribersCount"] = _subscribersCount;
    map["license"] = _license;
    return map;
  }
}

/// key : "mit"
/// name : "MIT License"
/// spdx_id : "MIT"
/// url : "https://api.github.com/licenses/mit"
/// node_id : "MDc6TGljZW5zZW1pdA=="

class LicenseBean {
  String _key;
  String _name;
  String _spdxId;
  String _url;
  String _nodeId;

  String get key => _key;
  String get name => _name;
  String get spdxId => _spdxId;
  String get url => _url;
  String get nodeId => _nodeId;

  LicenseBean(this._key, this._name, this._spdxId, this._url, this._nodeId);

  LicenseBean.map(dynamic obj) {
    this._key = obj["key"];
    this._name = obj["name"];
    this._spdxId = obj["spdxId"];
    this._url = obj["url"];
    this._nodeId = obj["nodeId"];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["key"] = _key;
    map["name"] = _name;
    map["spdxId"] = _spdxId;
    map["url"] = _url;
    map["nodeId"] = _nodeId;
    return map;
  }
}
