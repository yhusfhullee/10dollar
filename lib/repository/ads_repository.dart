import 'dart:io';
import 'package:blurhash/blurhash.dart';

import '../models/model.dart';
import 'package:appwrite/appwrite.dart';
import '../core/constants/constant.dart';
import '../provider/appwrite_provider.dart';
import 'package:tendollarapp/repository/stoorage.dart';

class AdsAPi {
  static Databases _databases = Databases(AppWriteProvider().getclClient);

  static Future uploadAds({
    required String header,
    required String uid,
    required String descrition,
    String? testAds,
    File? file,
    required String username,
    required String profImage,
    required bool isShow,
    required String type,
  }) async {
    String res = 'some error occurred';
    try {
      if (file == null) {
        String postid = ID.unique();

        AdsModel ads = AdsModel(
          isShow: isShow,
          adsId: '',
          thumbnail: " ",
          discription: descrition,
          type: type,
          blurHash: "blurHash",
          uid: uid,
          photoUrl: profImage,
          like: [],
          Reply: [],
          postUrl: testAds!,
          header: header,
          postedAt: DateTime.now(),
        );
        _databases.createDocument(
            databaseId: AppWriteConstants.databaseId,
            collectionId: AppWriteConstants.adsCollection,
            documentId: postid,
            data: ads.toMap());
        res = "success";
      } else {
        String postUrl = await StoraageMethod().uploadFileTostorage(file, true);
        String blurHash = await BlurHash.encode(file.readAsBytesSync(), 7, 8);
        String postid = ID.unique();
        AdsModel ads = AdsModel(
          isShow: isShow,
          adsId: ' ',
          thumbnail: " ",
          discription: descrition,
          type: type,
          blurHash: blurHash,
          uid: uid,
          photoUrl: profImage,
          like: [],
          Reply: [],
          postUrl: postUrl,
          header: header,
          postedAt: DateTime.now(),
        );
        _databases.createDocument(
            databaseId: AppWriteConstants.databaseId,
            collectionId: AppWriteConstants.adsCollection,
            documentId: postid,
            data: ads.toMap());
        res = "success";
      }
    } on AppwriteException catch (e) {
      res = e.toString();
    }
    return res;
  }

  static Future<List<AdsModel>> getallAds() async {
    try {
      var post = await _databases.listDocuments(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.adsCollection,
          queries: [Query.orderDesc("\$createdAt")]);
      var posts =
          post.documents.map((post) => AdsModel.fromMap(post.data)).toList();

      return posts;
    } on AppwriteException {
      rethrow;
    }
  }

  static Future delectAds(String documentId) async {
    try {
      // await StoraageMethod().deleteFile(AppCo documentId);
      await _databases.deleteDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.adsCollection,
          documentId: documentId);
    } on AppwriteException {
      return;
    }
  }

  static editAds(AdsModel snap, String caption) async {
    if (snap.type == "text") {
      await _databases.updateDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.adsCollection,
          documentId: snap.adsId,
          data: {"postUrl": caption});
    } else {
      await _databases.updateDocument(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.adsCollection,
          documentId: snap.adsId,
          data: {"discription": caption});
    }
  }
}
