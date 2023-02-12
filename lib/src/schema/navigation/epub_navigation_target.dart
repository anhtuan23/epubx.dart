import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

import 'epub_metadata.dart';
import 'epub_navigation_label.dart';

class EpubNavigationTarget {
  String? iId;
  String? klass;
  String? value;
  String? playOrder;
  List<EpubNavigationLabel>? navigationLabels;
  EpubNavigationContent? content;

  @override
  int get hashCode {
    var objects = [
      iId.hashCode,
      klass.hashCode,
      value.hashCode,
      playOrder.hashCode,
      content.hashCode,
      ...navigationLabels!.map((label) => label.hashCode)
    ];
    return hashObjects(objects);
  }

  @override
  bool operator ==(other) {
    var otherAs = other as EpubNavigationTarget?;
    if (otherAs == null) return false;

    if (!(iId == otherAs.iId &&
        klass == otherAs.klass &&
        value == otherAs.value &&
        playOrder == otherAs.playOrder &&
        content == otherAs.content)) {
      return false;
    }

    return collections.listsEqual(navigationLabels, otherAs.navigationLabels);
  }
}
