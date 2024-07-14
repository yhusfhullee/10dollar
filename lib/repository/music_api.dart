import 'dart:io';
import 'package:appwrite/appwrite.dart';
import '../core/constants/constant.dart';
import 'package:file_picker/file_picker.dart';
import 'package:tendollarapp/repository/stoorage.dart';
import 'package:tendollarapp/models/10_dollar_music.dart';
import 'package:tendollarapp/provider/secure_storage.dart';
import 'package:tendollarapp/core/constants/app_write.dart';
import 'package:tendollarapp/provider/appwrite_provider.dart';


class MusicApi {
  static final Databases db = Databases(AppWriteProvider().getclClient);
  Future upLoadMusic({
    PlatformFile? file,
    File? artfile,
    required String musictitle,
    required String artistName,
    required String musicDiscription,
    required String genre,
    required String featuiring,
  }) async {
    var ref = StoraageMethod().UploadMusitoStorage(file, musictitle);

    ref.whenComplete(() async {
      var id = await SecureStorage.getMusicId();
      var uid = await SecureStorage.getId();
      if (id != null && uid != null) {
        var musicArtUrl;
        if (artfile != null) {
          musicArtUrl = await StoraageMethod().uploadmusicArt(artfile, id);
        }

        var link =
            await AppWriteConstants.getUrl(id, AppWriteConstants.bucketmusiid);

        MusicModel musicModel = MusicModel(
            musicArt:
                artfile == null ? AppWriteConstants.logoUrl : musicArtUrl,
            musicUrl: link,
            uid: uid,
            likes: [],
            musictitle: musictitle,
            musicId: id,
            datePublised: DateTime.now(),
            artistName: artistName,
            musicDiscription: musicDiscription,
            genre: genre,
            featuiring: featuiring);

        await db.createDocument(
            databaseId: AppWriteConstants.databaseId,
            collectionId: AppWriteConstants.musicDatabaseId,
            documentId: id,
            data: musicModel.toMap());
      }
    });
  }

  Future<List<MusicModel>> getAllMusic() async {
    var music = await db.listDocuments(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.musicDatabaseId,
        queries: [Query.orderDesc("datePublised")]);
    List<MusicModel> musicModels = music.documents
        .map((musicdata) => MusicModel.fromMap(musicdata.data))
        .toList();
    return musicModels;
  }
}
