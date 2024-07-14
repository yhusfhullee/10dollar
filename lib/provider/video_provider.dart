import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';

import '../core/constants/constant.dart';
import '../models/model.dart';
import '../repository/repository.dart';
import 'appwrite_provider.dart';

class VideoListProvider extends ChangeNotifier {
  bool isLoading = false;
  List<VideoModel> _videoList = [];
  static Realtime _realtime = AppWriteProvider().getReatime;

  List<VideoModel> get allvideo => _videoList;

  getAllVideo() async {
    _videoList = [];
    var posts = await VideoApi.getAllvideo();
    _videoList.addAll(posts);
    realtime();
    notifyListeners();
  }

  uploadVideo({
    required File file,
    required String caption,
    required File thumbnail,
  }) async {
    // isLoading = true;
    // notifyListeners();
    // print("am Called");
    // var fileName = await VideoCompress.getFileThumbnail(
    //   file.path, // s200pecify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
    //   quality: 100,
    // );

    isLoading = true;
    notifyListeners();
    await VideoApi.upVideoMusic(
      caption: caption,
      file: file,
      thumbnail: thumbnail,
    );
    isLoading = false;
    notifyListeners();
  }

  List<VideoModel> getMyVideo(String uid) {
    var myvideo = _videoList.where((element) => element.uid == uid).toList();
    notifyListeners();
    return myvideo;
  }

  realtime() async {
    var sub = _realtime.subscribe([
      "databases.${AppWriteConstants.databaseId}.collections.${AppWriteConstants.VideoDataBaseid}.documents",
    ]).stream;
    sub.listen((event) {
      if (event.payload.isNotEmpty &&
          event.events.contains(
              "databases.${AppWriteConstants.databaseId}.collections.${AppWriteConstants.VideoDataBaseid}.documents.*.create")) {
        VideoModel newUpdate = VideoModel.fromMap(event.payload);
        final chatId = newUpdate.videoId;
        final existingPostIndex =
            _videoList.indexWhere((element) => element.videoId == chatId);
        if (existingPostIndex != -1) {
          _videoList[existingPostIndex] = newUpdate;
          notifyListeners();
        } else {
          _videoList.insert(0, newUpdate);
          notifyListeners();
        }
      } else if (event.events.contains(
          "databases.${AppWriteConstants.databaseId}.collections.${AppWriteConstants.VideoDataBaseid}.documents.*.update")) {
        VideoModel newUpdate = VideoModel.fromMap(event.payload);
        final chatId = newUpdate.videoId;
        newUpdate =
            _videoList.where((element) => element.videoId == chatId).first;
        final index = _videoList.indexOf(newUpdate);
        _videoList.removeWhere((element) => element.videoId == chatId);
        _videoList.insert(index, VideoModel.fromMap(event.payload));
        notifyListeners();
      }
    });
  }
}
