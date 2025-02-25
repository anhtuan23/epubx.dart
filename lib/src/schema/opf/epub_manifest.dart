import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

import 'epub_manifest_item.dart';

class EpubManifest {
  List<EpubManifestItem>? items;

  EpubManifest() {
    items = <EpubManifestItem>[];
  }

  @override
  int get hashCode {
    return hashObjects(items!.map((item) => item.hashCode));
  }

  @override
  bool operator ==(other) {
    var otherAs = other as EpubManifest?;
    if (otherAs == null) {
      return false;
    }
    return collections.listsEqual(items, otherAs.items);
  }
}
