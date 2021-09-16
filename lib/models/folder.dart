class FolderFull {
  FolderFull({
    required this.files,
    required this.folders,
    required this.current,
    required this.pathParts,
    required this.startIndex,
    required this.count,
    required this.total,
  });
  late final List<File> files;
  late final List<Folder> folders;
  late final Current current;
  late final List<int> pathParts;
  late final int startIndex;
  late final int count;
  late final int total;

  FolderFull.fromJson(Map<String, dynamic> json) {
    files = List.from(json['files']).map((e) => File.fromJson(e)).toList();
    folders =
        List.from(json['folders']).map((e) => Folder.fromJson(e)).toList();
    current = Current.fromJson(json['current']);
    pathParts = List.from(json['pathParts'].toList());
    startIndex = json['startIndex'];
    count = json['count'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['files'] = files.map((e) => e.toJson()).toList();
    _data['folders'] = folders.map((e) => e.toJson()).toList();
    _data['current'] = current.toJson();
    _data['pathParts'] = pathParts.toList();
    _data['startIndex'] = startIndex;
    _data['count'] = count;
    _data['total'] = total;
    return _data;
  }
}

class File {
  File({
    required this.folderId,
    required this.version,
    required this.versionGroup,
    required this.contentLength,
    required this.pureContentLength,
    required this.fileStatus,
    required this.viewUrl,
    required this.fileType,
    required this.fileExst,
    required this.comment,
    required this.id,
    required this.title,
    required this.access,
    required this.shared,
    required this.rootFolderType,
    required this.updatedBy,
    required this.created,
    required this.createdBy,
    required this.updated,
  });
  late final int folderId;
  late final int version;
  late final int versionGroup;
  late final String contentLength;
  late final int pureContentLength;
  late final int fileStatus;
  late final String viewUrl;
  late final int fileType;
  late final String fileExst;
  late final String comment;
  late final int id;
  late final String title;
  late final int access;
  late final bool shared;
  late final int rootFolderType;
  late final UpdatedBy updatedBy;
  late final String created;
  late final UpdatedBy createdBy;
  late final String updated;

  File.fromJson(Map<String, dynamic> json) {
    folderId = json['folderId'];
    version = json['version'];
    versionGroup = json['versionGroup'];
    contentLength = json['contentLength'];
    pureContentLength = json['pureContentLength'];
    fileStatus = json['fileStatus'];
    viewUrl = json['viewUrl'];
    fileType = json['fileType'];
    fileExst = json['fileExst'];
    comment = json['comment'];
    id = json['id'];
    title = json['title'];
    access = json['access'];
    shared = json['shared'];
    rootFolderType = json['rootFolderType'];
    updatedBy = UpdatedBy.fromJson(json['updatedBy']);
    created = json['created'];
    createdBy = UpdatedBy.fromJson(json['createdBy']);
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['folderId'] = folderId;
    _data['version'] = version;
    _data['versionGroup'] = versionGroup;
    _data['contentLength'] = contentLength;
    _data['pureContentLength'] = pureContentLength;
    _data['fileStatus'] = fileStatus;
    _data['viewUrl'] = viewUrl;
    _data['fileType'] = fileType;
    _data['fileExst'] = fileExst;
    _data['comment'] = comment;
    _data['id'] = id;
    _data['title'] = title;
    _data['access'] = access;
    _data['shared'] = shared;
    _data['rootFolderType'] = rootFolderType;
    _data['updatedBy'] = updatedBy.toJson();
    _data['created'] = created;
    _data['createdBy'] = createdBy.toJson();
    _data['updated'] = updated;
    return _data;
  }
}

class UpdatedBy {
  UpdatedBy({
    required this.id,
    required this.displayName,
    required this.title,
    required this.avatarSmall,
    required this.profileUrl,
  });
  late final String? id;
  late final String? displayName;
  late final String? title;
  late final String? avatarSmall;
  late final String? profileUrl;

  UpdatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['displayName'];
    title = json['title'];
    avatarSmall = json['avatarSmall'];
    profileUrl = json['profileUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['displayName'] = displayName;
    _data['title'] = title;
    _data['avatarSmall'] = avatarSmall;
    _data['profileUrl'] = profileUrl;
    return _data;
  }
}

class Folder {
  Folder({
    required this.parentId,
    required this.filesCount,
    required this.foldersCount,
    required this.id,
    required this.title,
    required this.access,
    required this.shared,
    required this.rootFolderType,
    required this.updatedBy,
    required this.created,
    required this.createdBy,
    required this.updated,
  });
  late final int parentId;
  late final int filesCount;
  late final int foldersCount;
  late final int id;
  late final String title;
  late final int access;
  late final bool shared;
  late final int rootFolderType;
  late final UpdatedBy updatedBy;
  late final String created;
  late final UpdatedBy createdBy;
  late final String updated;

  Folder.fromJson(Map<String, dynamic> json) {
    parentId = json['parentId'];
    filesCount = json['filesCount'];
    foldersCount = json['foldersCount'];
    id = json['id'];
    title = json['title'];
    access = json['access'];
    shared = json['shared'];
    rootFolderType = json['rootFolderType'];
    updatedBy = UpdatedBy.fromJson(json['updatedBy']);
    created = json['created'];
    createdBy = UpdatedBy.fromJson(json['createdBy']);
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['parentId'] = parentId;
    _data['filesCount'] = filesCount;
    _data['foldersCount'] = foldersCount;
    _data['id'] = id;
    _data['title'] = title;
    _data['access'] = access;
    _data['shared'] = shared;
    _data['rootFolderType'] = rootFolderType;
    _data['updatedBy'] = updatedBy.toJson();
    _data['created'] = created;
    _data['createdBy'] = createdBy.toJson();
    _data['updated'] = updated;
    return _data;
  }
}

class Current {
  Current({
    required this.parentId,
    required this.filesCount,
    required this.foldersCount,
    required this.id,
    required this.title,
    required this.access,
    required this.shared,
    required this.rootFolderType,
    required this.updatedBy,
    required this.created,
    required this.createdBy,
    required this.updated,
  });
  late final int parentId;
  late final int filesCount;
  late final int foldersCount;
  late final int id;
  late final String title;
  late final int access;
  late final bool shared;
  late final int rootFolderType;
  late final UpdatedBy updatedBy;
  late final String created;
  late final UpdatedBy createdBy;
  late final String updated;

  Current.fromJson(Map<String, dynamic> json) {
    parentId = json['parentId'];
    filesCount = json['filesCount'];
    foldersCount = json['foldersCount'];
    id = json['id'];
    title = json['title'];
    access = json['access'];
    shared = json['shared'];
    rootFolderType = json['rootFolderType'];
    updatedBy = UpdatedBy.fromJson(json['updatedBy']);
    created = json['created'];
    createdBy = UpdatedBy.fromJson(json['createdBy']);
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['parentId'] = parentId;
    _data['filesCount'] = filesCount;
    _data['foldersCount'] = foldersCount;
    _data['id'] = id;
    _data['title'] = title;
    _data['access'] = access;
    _data['shared'] = shared;
    _data['rootFolderType'] = rootFolderType;
    _data['updatedBy'] = updatedBy.toJson();
    _data['created'] = created;
    _data['createdBy'] = createdBy.toJson();
    _data['updated'] = updated;
    return _data;
  }
}