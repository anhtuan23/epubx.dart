import 'package:quiver/collection.dart' as collections;
import 'package:quiver/core.dart';

import 'epub_byte_content_file_ref.dart';
import 'epub_content_file_ref.dart';
import 'epub_text_content_file_ref.dart';

class EpubContentRef {
  final Map<String, EpubTextContentFileRef> html;
  final Map<String, EpubTextContentFileRef> css;
  final Map<String, EpubByteContentFileRef> images;
  final Map<String, EpubByteContentFileRef> fonts;
  final Map<String, EpubContentFileRef> allFiles;

  EpubContentRef({
    Map<String, EpubTextContentFileRef>? html,
    Map<String, EpubTextContentFileRef>? css,
    Map<String, EpubByteContentFileRef>? images,
    Map<String, EpubByteContentFileRef>? fonts,
    Map<String, EpubContentFileRef>? allFiles,
  })  : html = html ?? <String, EpubTextContentFileRef>{},
        css = css ?? <String, EpubTextContentFileRef>{},
        images = images ?? <String, EpubByteContentFileRef>{},
        fonts = fonts ?? <String, EpubByteContentFileRef>{},
        allFiles = allFiles ?? <String, EpubContentFileRef>{};

  @override
  int get hashCode {
    var objects = [
      ...html.keys.map((key) => key.hashCode),
      ...html.values.map((value) => value.hashCode),
      ...css.keys.map((key) => key.hashCode),
      ...css.values.map((value) => value.hashCode),
      ...images.keys.map((key) => key.hashCode),
      ...images.values.map((value) => value.hashCode),
      ...fonts.keys.map((key) => key.hashCode),
      ...fonts.values.map((value) => value.hashCode),
      ...allFiles.keys.map((key) => key.hashCode),
      ...allFiles.values.map((value) => value.hashCode)
    ];

    return hashObjects(objects);
  }

  @override
  bool operator ==(other) {
    if (other is! EpubContentRef) {
      return false;
    }

    return collections.mapsEqual(html, other.html) &&
        collections.mapsEqual(css, other.css) &&
        collections.mapsEqual(images, other.images) &&
        collections.mapsEqual(fonts, other.fonts) &&
        collections.mapsEqual(allFiles, other.allFiles);
  }
}
