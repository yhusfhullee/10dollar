import '../models/userModel.dart';
import '../provider/provider.dart';
import 'package:flutter/material.dart';
import '../core/constants/constant.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageView extends StatefulWidget {
  final String? visiblity;
  final String? uid;
  final String snap;
  const ImageView({
    super.key,
    this.uid,
    required this.snap,
    required this.visiblity,
  });

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  var _cacheKey;
  void _refreshImage() {
    // Generate a new UniqueKey to force the widget to rebuild
    setState(() {
      _cacheKey = DateTime.now().toIso8601String();
    });
  }

  @override
  void initState() {
    _refreshImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserModel? userProvider = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.blueColor,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColor.whiteColor,
            ),
          ),
          actions: [
            userProvider == null
                ? Container()
                : PopupMenuButton(
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                            onTap: () {},
                            child: Text('Download'),
                            value: 'Download',
                          ),
                          PopupMenuItem(
                            onTap: () {},
                            child: Text('Edit Image'),
                            value: 'Edit Image',
                          ),
                        ],
                    onSelected: (value) {
                      // Handle the selected option
                      if (value == 'Download') {
                        //    Get.to(() => CreateNewGroup(userModel: userNo));
                      } else if (value == 'Edit Image') {
                        //  Get.to(() => AddImage(uid: userProvider.uid));
                      }
                    })
          ],
        ),
        body: Stack(
          children: [
            Center(
                child: Container(
                    color: AppColor.blueColor,
                    width: double.infinity,
                    child: CachedNetworkImage(
                        cacheKey: _cacheKey,
                        imageUrl: widget.snap,
                        fit: BoxFit.contain,
                        placeholder: ((context, url) =>
                            Image.asset(AppImage.imageholder)),
                        errorWidget: ((context, url, error) => Image.asset(
                              AppImage.profileholder,
                              height: 350,
                              width: double.infinity,
                            ))))),
            Visibility(
              visible: widget.visiblity != "profile",
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
