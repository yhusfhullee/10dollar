import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:file_picker/file_picker.dart';
import 'package:appwrite/appwrite.dart' as appWrite;
import 'package:tendollarapp/provider/secure_storage.dart';
import 'package:tendollarapp/core/constants/app_write.dart';
import 'package:tendollarapp/provider/appwrite_provider.dart';

class StoraageMethod {
  final appWrite.Storage _storage =
      appWrite.Storage(AppWriteProvider().getclClient);

  Future<String> uploadFileTostorage(File file, bool isPost) async {
    if (isPost) {
      String id = Uuid().v4();

      var ref = await _storage.createFile(
          bucketId: AppWriteConstants.bucketPostId,
          fileId: id,
          file: appWrite.InputFile.fromPath(path: file.path));
      return AppWriteConstants.getUrl(ref.$id, AppWriteConstants.bucketPostId);
    } else {
      String? id = await SecureStorage.getId();
      var ref = await _storage.createFile(
          bucketId: AppWriteConstants.bucketphotoId,
          fileId: id!,
          file: appWrite.InputFile.fromPath(path: file.path));
      return AppWriteConstants.getUrl(ref.$id, AppWriteConstants.bucketphotoId);
    }
  }

  Future<String> uploadThumbnail(File file, String id) async {
    var ref = await _storage.createFile(
        bucketId: AppWriteConstants.thumbnailbucket,
        fileId: id,
        file: appWrite.InputFile.fromPath(path: file.path));
    return AppWriteConstants.getUrl(ref.$id, AppWriteConstants.thumbnailbucket);
  }

  Future<String> uploadmusicArt(File file, String id) async {
    var ref = await _storage.createFile(
        bucketId: AppWriteConstants.bucketmusicArt,
        fileId: id,
        file: appWrite.InputFile.fromPath(path: file.path));
    return AppWriteConstants.getUrl(ref.$id, AppWriteConstants.bucketmusicArt);
  }

  Future deleteFile(String bucketId, String id) async {
    await _storage.deleteFile(
      bucketId: bucketId,
      fileId: id,
    );
  }

  Future UploadMusitoStorage(PlatformFile? file, String name) async {
    if (file == null) {
    } else {
      try {
        ;
        String id = Uuid().v4();
        final ref = _storage.createFile(
            bucketId: AppWriteConstants.bucketmusiid,
            fileId: id,
            file:
                appWrite.InputFile.fromPath(path: file.path!, filename: name));
        SecureStorage.saveMusicId(id);
        return ref;
      } on appWrite.AppwriteException catch (e) {
        return e.message;
      }
    }
  }

  Future UploadVideo(File file, String name) async {
    try {
      SecureStorage.clearVideoId();

      String id = Uuid().v4();
      final ref = _storage.createFile(
          bucketId: AppWriteConstants.vodeobuckedid,
          fileId: id,
          file: appWrite.InputFile.fromPath(path: file.path, filename: name));
      SecureStorage.saveVideoId(id);
      return ref;
    } on appWrite.AppwriteException catch (e) {
      return e.message;
    }
  }
}
