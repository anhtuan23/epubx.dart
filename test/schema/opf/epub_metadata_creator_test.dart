library epubreadertest;

import 'package:epubx/src/schema/opf/epub_metadata_creator.dart';
import 'package:test/test.dart';

main() async {
  var reference = EpubMetadataCreator()
    ..creator = "orthros"
    ..fileAs = "Large"
    ..role = "Creator";

  late EpubMetadataCreator testMetadataCreator;
  setUp(() async {
    testMetadataCreator = EpubMetadataCreator()
      ..creator = reference.creator
      ..fileAs = reference.fileAs
      ..role = reference.role;
  });

  group("EpubMetadataCreator", () {
    group(".equals", () {
      test("is true for equivalent objects", () async {
        expect(testMetadataCreator, equals(reference));
      });

      test("is false when Creator changes", () async {
        testMetadataCreator.creator = "NotOrthros";
        expect(testMetadataCreator, isNot(reference));
      });
      test("is false when FileAs changes", () async {
        testMetadataCreator.fileAs = "Small";
        expect(testMetadataCreator, isNot(reference));
      });
      test("is false when Role changes", () async {
        testMetadataCreator.role = "Copier";
        expect(testMetadataCreator, isNot(reference));
      });
    });

    group(".hashCode", () {
      test("is true for equivalent objects", () async {
        expect(testMetadataCreator.hashCode, equals(reference.hashCode));
      });

      test("is false when Creator changes", () async {
        testMetadataCreator.creator = "NotOrthros";
        expect(testMetadataCreator.hashCode, isNot(reference.hashCode));
      });
      test("is false when FileAs changes", () async {
        testMetadataCreator.fileAs = "Small";
        expect(testMetadataCreator.hashCode, isNot(reference.hashCode));
      });
      test("is false when Role changes", () async {
        testMetadataCreator.role = "Copier";
        expect(testMetadataCreator.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
