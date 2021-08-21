@JS()
library js_libds;

import 'dart:html';

import 'package:js/js.dart';
import 'package:js/js_util.dart';

extension WindowExt on Window {
  Future<dynamic> showOpenFilePicker() {
    final Object t = this;
    return promiseToFuture<dynamic>(
        callMethod(t, "showOpenFilePicker", []) as Object);
  }

  Future<FileSystemDirectoryHandle> showDirectoryPicker() {
    final Object t = this;
    return promiseToFuture<FileSystemDirectoryHandle>(
        callMethod(t, "showDirectoryPicker", []) as Object);
  }
}

@JS()
@anonymous
abstract class FileSystemDirectoryHandle {
  external String get name;
  external String get kind;
}

extension FileSystemDirectoryHandleExt on FileSystemDirectoryHandle {
  Future<FileSystemFileHandle> getFileHandle(String name,
      [HandleOptions? options]) {
    return promiseToFuture<FileSystemFileHandle>(
        callMethod(this, "getFileHandle", [name, options]) as Object);
  }

  Future<FileSystemDirectoryHandle> getDirectoryHandle(String name,
      [HandleOptions? options]) {
    return promiseToFuture<FileSystemDirectoryHandle>(
        callMethod(this, "getDirectoryHandle", [name, options]) as Object);
  }

  Future<void> writeToFile(String name, dynamic content) async {
    final fileHnadle =
        await this.getFileHandle(name, HandleOptions(create: true));
    final writable = await fileHnadle.createWritable();
    await writable.write(content);
    await writable.close();
    print("successfullt wrote file");
  }
}

@JS()
@anonymous
abstract class HandleOptions {
  external factory HandleOptions({bool? create});
}

@JS()
@anonymous
abstract class FileSystemFileHandle {}

extension FileSystemFileHandleExt on FileSystemFileHandle {
  Future<FileSystemWritableFileStream> createWritable() {
    return promiseToFuture<FileSystemWritableFileStream>(
        callMethod(this, "createWritable", []) as Object);
  }
}

@JS()
@anonymous
abstract class FileSystemWritableFileStream {}

extension FileSystemWritableFileStreamExt on FileSystemWritableFileStream {
  Future<void> write(dynamic data) {
    return promiseToFuture<void>(callMethod(this, "write", [data]) as Object);
  }

  Future<void> close() {
    return promiseToFuture<void>(callMethod(this, "close", []) as Object);
  }
}
