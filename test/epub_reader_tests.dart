library epubreadertest;

import 'dart:io' as io;

import 'package:path/path.dart' as path;
import 'package:test/test.dart';

import 'package:epubx/epubx.dart';

main() async {
  String fileName = "hittelOnGoldMines.epub";
  String fullPath =
      path.join(io.Directory.current.path, "test", "res", fileName);
  var targetFile = io.File(fullPath);
  if (!(await targetFile.exists())) {
    throw Exception("Specified epub file not found: $fullPath");
  }

  List<int> bytes = await targetFile.readAsBytes();
  test("Test Epub Ref", () async {
    EpubBookRef epubRef = await EpubReader.openBook(bytes);

    expect(epubRef.author, equals("John S. Hittell"));
    expect(epubRef.title, equals("Hittel on Gold Mines and Mining"));
  });
  test("Test Epub Read", () async {
    EpubBook epubRef = await EpubReader.readBook(bytes);

    expect(epubRef.author, equals("John S. Hittell"));
    expect(epubRef.title, equals("Hittel on Gold Mines and Mining"));
  });

  test("Test can read", () async {
    String baseName =
        path.join(io.Directory.current.path, "test", "res", "std");
    io.Directory baseDir = io.Directory(baseName);
    if (!(await baseDir.exists())) {
      throw Exception("Base path does not exist: $baseName");
    }

    await baseDir
        .list(recursive: false, followLinks: false)
        .forEach((io.FileSystemEntity fe) async {
      try {
        io.File tf = io.File(fe.path);
        List<int> bytes = await tf.readAsBytes();
        EpubBook book = await EpubReader.readBook(bytes);
        expect(book, isNotNull);
      } catch (e) {
        print("File: ${fe.path}, Exception: $e");
        fail("Caught error...");
      }
    });
  });

  test("Test can open", () async {
    var baseName = path.join(io.Directory.current.path, "test", "res", "std");
    var baseDir = io.Directory(baseName);
    if (!(await baseDir.exists())) {
      throw Exception("Base path does not exist: $baseName");
    }

    await baseDir
        .list(recursive: false, followLinks: false)
        .forEach((io.FileSystemEntity fe) async {
      try {
        var tf = io.File(fe.path);
        var bytes = await tf.readAsBytes();
        var ref = await EpubReader.openBook(bytes);
        expect(ref, isNotNull);
      } catch (e) {
        print("File: ${fe.path}, Exception: $e");
        fail("Caught error...");
      }
    });
  });
}
