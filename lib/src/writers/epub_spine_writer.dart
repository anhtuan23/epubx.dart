import 'package:epubx/src/schema/opf/epub_spine.dart';
import 'package:xml/xml.dart';

class EpubSpineWriter {
  static void writeSpine(XmlBuilder builder, EpubSpine spine) {
    builder.element('spine', attributes: {'toc': spine.tableOfContents!},
        nest: () {
      for (var spineitem in spine.items!) {
        builder.element('itemref',
              attributes: {
                'idref': spineitem.idRef!,
                'linear': spineitem.isLinear! ? 'no' : 'yes'
              });
      }
    });
  }
}
