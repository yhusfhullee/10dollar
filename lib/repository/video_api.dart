import 'dart:io';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as m;
import 'package:blurhash/blurhash.dart';
import 'package:tendollarapp/models/post_model.dart';
import 'package:tendollarapp/repository/stoorage.dart';
import 'package:tendollarapp/models/vote_video_model.dart';
import 'package:tendollarapp/provider/secure_storage.dart';
import 'package:tendollarapp/core/constants/app_write.dart';
import 'package:tendollarapp/provider/appwrite_provider.dart';

class VideoApi {
  static final Databases db = Databases(AppWriteProvider().getclClient);
  static Future upVideoMusic({
    required File file,
    required String caption,
    required File thumbnail,
  }) async {
    var ref = StoraageMethod().UploadVideo(file, "file.name");

    ref.whenComplete(() async {
      var id = await SecureStorage.getVideoId();
      var uid = await SecureStorage.getId();
      if (id != null && uid != null) {
        var thumbnailUrl =
            await StoraageMethod().uploadThumbnail(thumbnail, id);
        var link =
            await AppWriteConstants.getUrl(id, AppWriteConstants.vodeobuckedid);
        String blurHash =
            await BlurHash.encode(thumbnail.readAsBytesSync(), 7, 8);
        VideoModel videoModel = VideoModel(
            blurHash: blurHash,
            thumbnail: thumbnailUrl,
            videoId: id,
            caption: caption,
            uid: uid,
            videoUrl: link,
            postedAt: DateTime.now());

        await db.createDocument(
            databaseId: AppWriteConstants.databaseId,
            collectionId: AppWriteConstants.VideoDataBaseid,
            documentId: id,
            data: videoModel.toMap());

        PostModel post = PostModel(
          blurHash: blurHash,
          thumbnail: thumbnailUrl,
          type: "video",
          uid: uid,
          like: [],
          comments: [],
          postId: id,
          postUrl: link,
          discription: caption,
          postedAt: DateTime.now(),
        );

        await db.createDocument(
            databaseId: AppWriteConstants.databaseId,
            collectionId: AppWriteConstants.postDatabaseId,
            documentId: ID.unique(),
            data: post.toMap());
      }
    });
  }

  static Future<List<VideoModel>> getAllvideo() async {
    try {
      m.DocumentList video = await db.listDocuments(
          databaseId: AppWriteConstants.databaseId,
          collectionId: AppWriteConstants.VideoDataBaseid,
          queries: [Query.orderDesc("postedAt")]);
      List<VideoModel> videoModels = video.documents
          .map((musicdata) => VideoModel.fromMap(musicdata.data))
          .toList();
      return videoModels;
    } on AppwriteException {
      rethrow;
    }
  }
}
