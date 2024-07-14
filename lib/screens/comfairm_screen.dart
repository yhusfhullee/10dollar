import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tendollarapp/features/home/screens/home_page.dart';

import '../global_widget/text_from_field.dart';
import 'package:video_player/video_player.dart';

import 'package:tendollarapp/models/userModel.dart';
import '../features/auth/controller/showsnackBar.dart';

import 'package:tendollarapp/core/constants/constant.dart';

import '../provider/provider.dart';

class ComfairmScreen extends StatefulWidget {
  final File thumbnail;
  final File Upvideo;
  final String videoPath;

  const ComfairmScreen(
      {super.key,
      required this.Upvideo,
      required this.thumbnail,
      required this.videoPath});

  @override
  State<ComfairmScreen> createState() => _ComfairmScreenState();
}

class _ComfairmScreenState extends State<ComfairmScreen> {
  TextEditingController songcaptionController = TextEditingController();
  late VideoPlayerController controller;
  @override
  void initState() {
    controller = VideoPlayerController.file(File(widget.Upvideo.path),
        videoPlayerOptions: VideoPlayerOptions());

    controller.initialize().then((value) {
      setState(() {});
    });
    controller.play();

    controller.setVolume(1);
    controller.setLooping(true);

    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    songcaptionController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserModel? userProvider = Provider.of<UserProvider>(context).getUser;

    return userProvider == null
        ? Container()
        : Scaffold(
            appBar: AppBar(actions: [
              Container(
                height: 30,
                width: 80,
                margin: EdgeInsets.symmetric(vertical: 5).copyWith(right: 10),
                decoration: BoxDecoration(
                    color: AppColor.blueColor,
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onTap: () async {
                    if (songcaptionController.text.isEmpty) {
                      ShowSnackBar(context, "Song Caption Is required ");
                    } else {
                      ShowSnackBar(context,
                          "Song Caption Is required ${widget.Upvideo.path}");
                      // context.read<VideoListProvider>().uploadVideo(
                      //     file: widget.Upvideo,
                      //     caption: songcaptionController.text);

                      context.read<VideoListProvider>().uploadVideo(
                          file: widget.Upvideo,
                          caption: songcaptionController.text,
                          thumbnail: widget.thumbnail);
                      // VideoApi.upVideoMusic(
                      //   thumbnail: fileName,
                      //   file: widget.Upvideo,
                      //   profImage: userProvider.photoUrl,
                      //   username: userProvider.username,
                      //   caption: songcaptionController.text,
                      // );
                      ShowSnackBar(context,
                          "You will be notified once it is successfully uploaded.");
                      Get.offAll(() => Home());
                      context.read<BottomNavProvider>().changeIndex(2);
                    }
                  },
                  child: Center(
                    child: Text(
                      "Post",
                      style: AppTextTheme.bodyText(color: AppColor.whiteColor),
                    ),
                  ),
                ),
              ),
            ]),
            body: Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Center(
                    child: SingleChildScrollView(
                      child: controller.value.isPlaying == true
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                VideoWidget(
                                  controller: controller,
                                ),
                              ],
                            )
                          : Container(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          TextForm(
                              Controller: songcaptionController,
                              hintText: "input your caption here"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

class VideoWidget extends StatefulWidget {
  const VideoWidget({
    super.key,
    required this.controller,
  });

  final VideoPlayerController controller;

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Center(
        child: GestureDetector(
      onTap: () {
        if (widget.controller.value.isPlaying) {
          widget.controller.pause();
        } else {
          widget.controller.play();
          setState(() {});
        }
      },
      child: Stack(
        children: [
          widget.controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: widget.controller.value.aspectRatio,
                  child: VideoPlayer(
                    widget.controller,
                  ),
                )
              : const CircularProgressIndicator()
        ],
      ),
    ));
  }
}
