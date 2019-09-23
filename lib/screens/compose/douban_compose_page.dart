import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/widgets/compat/safe_area.dart';
import 'package:firewood/widgets/divider/h_divider.dart';
import 'package:firewood/widgets/divider/v_divider.dart';
import 'package:firewood/widgets/navigation/action_search_bar.dart';
import 'package:firewood/widgets/overlay/overlay.dart';
import 'package:firewood/widgets/photo/photo_album.dart';
import 'package:flutter/material.dart';

class ComposePage extends StatefulWidget {
  @override
  _ComposePageState createState() => new _ComposePageState();
}

class _ComposePageState extends State<ComposePage> {
  ///
  TextEditingController textEditingController = TextEditingController();
  StreamController<bool> streamController = StreamController<bool>();

  bool hasEditingText = false;

  List<String> photos = List<String>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FSafeArea(Scaffold(
//      appBar: AppBar(
//        title: Text('编辑'),
//      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ActionBarWidget("编辑"),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    minHeight: SizeCompat.height() -
                        SizeCompat.pxToDp(210) -
                        SizeCompat.pxToDp(130) -
                        SizeCompat.top -
                        SizeCompat.bottom -
                        2,
                  ),
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      StreamBuilder(
                          initialData: hasEditingText,
                          stream: streamController.stream,
                          builder: (BuildContext context,
                              AsyncSnapshot<bool> snapshot) {
                            return Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(
                                  left: SizeCompat.pxToDp(40),
                                  right: SizeCompat.pxToDp(40)),
                              child: TextField(
//                          scrollPadding: const EdgeInsets.only(left:0.0,top: 60),
//                                maxLines: snapshot.data ? 100 : 1,
                                  maxLines: null,
                                  maxLength: 2000,
                                  maxLengthEnforced: true,

//                    obscureText: true,
//                    cursorWidth: 20,
//                    cursorRadius: Radius.circular(10),
//                    cursorColor: Colors.pinkAccent,
//                    readOnly: true,
                                  showCursor: true,
                                  style: TextStyle(
                                      fontSize: SizeCompat.pxToDp(44),
                                      height: 1.25,
                                      color: Color(0xff1a1a1a)),
                                  controller: textEditingController,
                                  keyboardType: TextInputType.text,
                                  autofocus: !snapshot.data,
                                  textInputAction: TextInputAction.done,
                                  onChanged: (val) {
                                    if (val.isEmpty) {
                                      if (hasEditingText) {
                                        streamController
                                            .add(hasEditingText = false);
                                      }
                                    } else {
                                      if (!hasEditingText) {
                                        streamController
                                            .add(hasEditingText = true);
                                      }
                                    }
                                  },
                                  onSubmitted: (val) {
                                    print("onSubmitted value=$val");
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    counterText: "",
//                                  counter: null,
//                            contentPadding:
//                                EdgeInsets.only(top: SizeCompat.pxToDp(60)),
                                    icon: hasEditingText
                                        ? null
                                        : Icon(
                                            Icons.camera,
                                            size: SizeCompat.pxToDp(80),
                                            color: Color(0xffbfbfbf),
                                          ),
                                    hintText: "思绪在无人的地方生长...",
                                    hintStyle: TextStyle(
                                        fontSize: SizeCompat.pxToDp(44),
                                        color: Color(0xff9f9f9f)),
                                  )),
                            );
                          }),
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeCompat.pxToDp(40),
                            right: SizeCompat.pxToDp(40)),
                        child: PhotoAlbum(
                            data: photos, size: SizeCompat.width() * 3 / 4),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: SizeCompat.pxToDp(90),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("公开....");
                    clickAuthority();
                  },
                  child: Container(
                    height: SizeCompat.pxToDp(60),
                    width: SizeCompat.pxToDp(140),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xffcccccc)),
                        borderRadius: BorderRadius.all(
                            Radius.circular(SizeCompat.pxToDp(30)))),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("images/ic_globe.png",
                            width: SizeCompat.pxToDp(45),
                            height: SizeCompat.pxToDp(45),
                            color: Color(0xffbfbfbf),
                            colorBlendMode: BlendMode.srcATop),
                        FHDivider(width: SizeCompat.pxToDp(10)),
                        Text(
                          "公开",
                          style: TextStyle(
                              fontSize: SizeCompat.pxToDp(30),
                              color: Color(0xff7f7f7f)),
                        ),
                      ],
                    ),
                  ),
                ),
                FHDivider(width: SizeCompat.pxToDp(50)),
              ],
            ),
            FVDivider(height: 1, color: Color(0xffe0e0e0)),
            GestureDetector(
              onTap: () {
                print("相册....");
                print(photos.toString());
              },
              child: Container(
                height: SizeCompat.pxToDp(120),
                padding: EdgeInsets.only(
                    left: SizeCompat.pxToDp(50), right: SizeCompat.pxToDp(50)),
                child: Image.asset(
                  "images/ic_photo_album.png",
                  width: SizeCompat.pxToDp(65),
                  height: SizeCompat.pxToDp(65),
                  color: Color(0xff191919),
                  colorBlendMode: BlendMode.srcATop,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  @override
  void dispose() {
    textEditingController.dispose();
    streamController.close();
    super.dispose();
  }

  FOverlay overlay = FOverlay();
  void clickAuthority() {
    overlay.open(context, null);
  }
}
