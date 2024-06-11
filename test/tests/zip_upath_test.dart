import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:test/test.dart';

void main() {
  test('unicode path in zip test', () {
    var path =
        r'D:\MyProjects\dart\dart_archive\test\tests\res\zip\유니코드path.zip';
    final data = File(path).readAsBytesSync();
    final archive = ZipDecoder().decodeBytes(data);
    expect(archive.fileName(0), 'test.txt');
    expect(archive.fileName(1), '한글 폴더/');
    expect(archive.fileName(2), '한글 폴더/한글 파일.txt');
  });

  test('unicode path in zip test2', () {
    var path =
        r'D:\MyProjects\dart\dart_archive\test\tests\res\zip\유니코드path.zip';
    final inputStream = InputFileStream(path);
    final archive = ZipDecoder().decodeBuffer(inputStream);
    expect(archive.fileName(0), 'test.txt');
    expect(archive.fileName(1), '한글 폴더/');
    expect(archive.fileName(2), '한글 폴더/한글 파일.txt');
  });
}
