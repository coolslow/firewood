import 'dart:io';

import 'package:firewood/playground/navigation/action_bar.dart';
import 'package:firewood/playground/util/fitem.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:barcode_scan/barcode_scan.dart';

class MediaDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MediaDemoPageState();
  }
}

class _MediaDemoPageState extends State<MediaDemoPage> {
  Future<File> imageFile;
  Future<String> barcode;

  @override
  Widget build(BuildContext context) {
    print("Media==》");

    return new Scaffold(
        appBar: ActionBarWidget("媒体"),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FItem.getItem(context, "相机", null, onPressed: () {
                pickImage(ImageSource.camera);
              }),
              FItem.getItem(context, "相册", null, onPressed: () {
                pickImage(ImageSource.gallery);
              }),
              FItem.getItem(context, "扫描二维码", null, onPressed: () {
                scan();
              }),
              showImage(),
              showBarcode(),
            ],
          ),
        ));
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(
            snapshot.data,
            width: 300,
            height: 300,
          );
        }
        return Container();
      },
    );
  }

  Widget showBarcode() {
    return FutureBuilder<String>(
      future: barcode,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Text(
            snapshot.data,
            style: TextStyle(fontSize: 13, color: Colors.red),
          );
        }
        return Container();
      },
    );
  }

  //Open gallery
  void pickImage(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  Future scan() async {
    try {
      Future<String> barcode = BarcodeScanner.scan();
      setState(() {
        this.barcode = barcode;
        print("$barcode}");
      });
    } catch (e) {
      print("${e.toString()}");
    }
  }
}
