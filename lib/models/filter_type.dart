import 'package:flutter/foundation.dart';

enum FilterType {
  None,
  FilesOnly,
  FoldersOnly,
  DocumentsOnly,
  PresentationsOnly,
  SpreadsheetsOnly,
  ImagesOnly,
  ByUser,
  ByDepartment,
  ArchiveOnly,
  ByExtension,
  MediaOnly,
}

extension FilterEx on FilterType {
  String get inString => describeEnum(this);
}
