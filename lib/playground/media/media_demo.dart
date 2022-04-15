// import 'dart:io';
//
// import 'package:firewood/playground/navigation/action_bar.dart';
// import 'package:firewood/playground/util/fitem.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class MediaDemoPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MediaDemoPageState();
//   }
// }
//
// class _MediaDemoPageState extends State<MediaDemoPage> {
//   late Future<XFile?> imageFile;
//
//   final ImagePicker _picker = ImagePicker();
//
//   @override
//   Widget build(BuildContext context) {
//     print("Media==》");
//
//     return new Scaffold(
//         appBar: ActionBarWidget("媒体"),
//         body: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               FItem.getItemCallback(context, "相机", null, onPressed: () {
//                 pickImage(ImageSource.camera);
//               }),
//               FItem.getItemCallback(context, "相册", null, onPressed: () {
//                 pickImage(ImageSource.gallery);
//               }),
//               showImage(),
//             ],
//           ),
//         ));
//   }
//
//   Widget showImage() {
//     return FutureBuilder<XFile?>(
//       future: imageFile,
//       builder: (BuildContext context, AsyncSnapshot<XFile?> snapshot) {
//         if (snapshot.connectionState == ConnectionState.done &&
//             snapshot.data != null) {
//           XFile xfile = snapshot.data as XFile;
//           return Image.file(
//             File(xfile.path),
//             width: 300,
//             height: 300,
//           );
//         }
//         return Container();
//       },
//     );
//   }
//
//   //Open gallery
//   void pickImage(ImageSource source) {
//     setState(() {
//       imageFile =  _picker.pickImage(source: source);
//     });
//   }
//
// }
