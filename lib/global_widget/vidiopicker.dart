import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:tendollarapp/screens/video_trimmer.dart';
import 'package:video_compress/video_compress.dart';

class addVideoPost extends StatefulWidget {
  const addVideoPost({super.key});

  @override
  State<addVideoPost> createState() => _addVideoPostState();
}

TextEditingController songtitleController = TextEditingController();

class _addVideoPostState extends State<addVideoPost> {
  File? _file;

  pickV() async {
    var path = await FilePicker.platform
        .pickFiles(type: FileType.video, allowMultiple: false);

    if (path != null) {
      setState(() {
        _file = File(path.files.first.path!);
      });

      if (_file != null) {
        setState(() {});
        var fileName = await VideoCompress.getFileThumbnail(
          _file!.path,
          // s200pecify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
          quality: 100,
        );
        Get.to(() => TrimmerView(
              thumbnail: fileName,
              file: File(
                _file!.path,
              ),
            ));
      }
    }
  }

  _selectVideo(BuildContext context) async {
    return showDialog(
      context: context,
      builder: ((context) {
        return SimpleDialog(
          title: const Text("Select A Soucre"),
          children: [
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.add_to_photos),
                  ),
                  const Text("From Gallery"),
                ],
              ),
              onPressed: pickV,
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.cancel),
                  ),
                  const Text("Cancel"),
                ],
              ),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _file == null
            ? Center(
                child: Container(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      child: Text("Add Video"),
                      onPressed: () async {
                        _selectVideo(context);
                      },
                    )))
            : null);
  }
}
