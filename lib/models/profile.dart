class Profile {
  Profile({
    required this.id,
    required this.userName,
    required this.isVisitor,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.status,
    required this.activationStatus,
    this.terminated,
    required this.department,
    required this.workFrom,
    required this.displayName,
    required this.avatarMedium,
    required this.avatar,
    required this.isAdmin,
    required this.isLDAP,
    required this.isOwner,
    required this.cultureName,
    required this.isSSO,
    required this.avatarSmall,
    required this.profileUrl,
  });
  late final String id;
  late final String userName;
  late final bool isVisitor;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final int status;
  late final int activationStatus;
  late final Null terminated;
  late final String department;
  late final String workFrom;
  late final String displayName;
  late final String avatarMedium;
  late final String avatar;
  late final bool isAdmin;
  late final bool isLDAP;
  late final bool isOwner;
  late final String cultureName;
  late final bool isSSO;
  late final String avatarSmall;
  late final String profileUrl;

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    isVisitor = json['isVisitor'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    status = json['status'];
    activationStatus = json['activationStatus'];
    terminated = null;
    department = json['department'];
    workFrom = json['workFrom'];
    displayName = json['displayName'];
    avatarMedium = json['avatarMedium'];
    avatar = json['avatar'];
    isAdmin = json['isAdmin'];
    isLDAP = json['isLDAP'];
    isOwner = json['isOwner'];
    cultureName = json['cultureName'];
    isSSO = json['isSSO'];
    avatarSmall = json['avatarSmall'];
    profileUrl = json['profileUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['userName'] = userName;
    _data['isVisitor'] = isVisitor;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['email'] = email;
    _data['status'] = status;
    _data['activationStatus'] = activationStatus;
    _data['terminated'] = terminated;
    _data['department'] = department;
    _data['workFrom'] = workFrom;
    _data['displayName'] = displayName;
    _data['avatarMedium'] = avatarMedium;
    _data['avatar'] = avatar;
    _data['isAdmin'] = isAdmin;
    _data['isLDAP'] = isLDAP;
    _data['isOwner'] = isOwner;
    _data['cultureName'] = cultureName;
    _data['isSSO'] = isSSO;
    _data['avatarSmall'] = avatarSmall;
    _data['profileUrl'] = profileUrl;
    return _data;
  }
}
