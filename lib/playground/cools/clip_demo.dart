import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ClipDemoPage extends StatefulWidget {
  @override
  _ClipDemoPage createState() => _ClipDemoPage();
}

class _ClipDemoPage extends State<ClipDemoPage> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<Rect> animation;

  List<ClipRequest> request = List<ClipRequest>();
  Rect desRect;
  GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();

    updataData(0);

    desRect = Rect.fromLTWH(0, 0, 300, 300);
    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = RectTween(begin: Rect.zero, end: desRect).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void updataData(double dx) {
    request.clear();
    request.add(ClipRequest.create(
      "http://wx4.sinaimg.cn/large/d2e27164gy1fdg00g82qkj21hc0w8npd.jpg",
      Rect.fromLTRB(20 + dx, 200, 80 + dx, 260),
    ));
    request.add(ClipRequest.create(
      "http://inews.gtimg.com/newsapp_match/0/10666557611/0.jpg",
      Rect.fromLTRB(120 + dx, 200, 180 + dx, 260),
    ));
    request.add(ClipRequest.create(
      "http://hbimg.b0.upaiyun.com/f2abb45006e56e3ac7623db40cc80b089d29d50632459-55vWJG_fw658",
      Rect.fromLTRB(220 + dx, 200, 280 + dx, 260),
    ));
    request.add(ClipRequest.create(
      "http://hbimg.b0.upaiyun.com/2c766e950156f8698c5aa09216044d6e0717a80f1953f-K91Jat_fw658",
      Rect.fromLTRB(320 + dx, 200, 380 + dx, 260),
    ));
    request.add(ClipRequest.create(
      "http://b-ssl.duitang.com/uploads/item/201705/10/20170510125352_HzRrT.jpeg",
      Rect.fromLTRB(420 + dx, 200, 480 + dx, 260),
    ));
    request.add(ClipRequest.create(
      "http://b-ssl.duitang.com/uploads/item/201612/20/20161220135154_yd5Fh.jpeg",
      Rect.fromLTRB(520 + dx, 200, 580 + dx, 260),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello World")),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                key: _key,
                onTapUp: (TapUpDetails details) {
                  click(details);
                },
                onHorizontalDragStart: (DragStartDetails details) {
                  dragStart(details);
                },
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  dragUpdate(details);
                },
//                onHorizontalDragEnd: (DragEndDetails details) {
//                  dragEnd(details);
//                },
                child: FutureBuilder<List<ClipResult>>(
                  future: ImageUtil.loadImage(request, true),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ClipResult>> snapshot) {
                    return AnimatedBuilder(
                      animation: animation,
                      builder: (BuildContext context, Widget child) {
                        print("Animated build");
                        return CustomPaint(
                          painter: ClipImageView(
                              snapshot.data, match, animation.value),
                          size: Size(desRect.width, desRect.height),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isOpen = false;
  int match = -1;

  void click(TapUpDetails details) {
    if (isOpen) {
      if (match >= 0) {
        animation = RectTween(begin: request[match].rect, end: desRect)
            .animate(controller);
        controller.reverse();
        isOpen = false;
        setState(() {});
      }
    } else {
      match = -1;
      for (int i = 0; i < request.length; i++) {
        ClipRequest clip = request[i];
        if (clip.rect.contains(details.localPosition)) {
          match = i;
          break;
        }
      }
      if (match >= 0) {
        animation = RectTween(begin: request[match].rect, end: desRect)
            .animate(controller);
        controller.forward();
        isOpen = true;
        setState(() {});
      }
    }
  }

  double deltaStartX = 0.0;
  double deltaUpdateX = 0.0;

  void dragStart(DragStartDetails details) {
    deltaStartX = details.localPosition.dx - deltaUpdateX;
    match = -1;
    setState(() {});
  }

  void dragUpdate(DragUpdateDetails details) {
    if (details.localPosition.dy < 200 || details.localPosition.dy > 260) {
      return;
    }
    deltaUpdateX = details.localPosition.dx - deltaStartX;
    updataData(deltaUpdateX);
    setState(() {});
  }

  void dragEnd(DragEndDetails details) {
    updataData(0);
    setState(() {});
  }
}

class ClipImageView extends CustomPainter {
  final List<ClipResult> images;
  final int index;
  final Rect change;

  ClipImageView(this.images, this.index, this.change);

  final red = Color.fromRGBO(255, 0, 0, 1);
  final blue = Color.fromRGBO(0, 0, 255, 1);
  final Paint painter = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    print("paint====");
    painter.color = Color(0x33ff0000);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), painter);
    painter.color = Color(0xffffffff);
    images.forEach((ClipResult result) {
      Rect src = ImageUtil.calculateSizeByTarget(result.image.width.toDouble(),
          result.image.height.toDouble(), size.width, size.height, result.rect);
      canvas.drawImageRect(result.image, src, result.rect, painter);
    });

    if (index >= 0) {
      Rect src = ImageUtil.calculateSizeByTarget(
          images[index].image.width.toDouble(),
          images[index].image.height.toDouble(),
          size.width,
          size.height,
          change);
      canvas.drawImageRect(images[index].image, src, change, painter);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ClipResult {
  final ui.Image image;
  final Rect rect;

  ClipResult.create(this.image, this.rect);
}

class ClipRequest {
  final String path;
  final Rect rect;

  ClipRequest.create(this.path, this.rect);
}

class ImageUtil {
  static Future<List<ClipResult>> loadImage(
      List<ClipRequest> paths, bool isUrl) async {
    List<ClipResult> result = List<ClipResult>();
    Completer<List<ClipResult>> completer = Completer<List<ClipResult>>();
    for (int i = 0; i < paths.length; i++) {
      ClipRequest data = paths[i];
      ImageStream stream;
      if (isUrl) {
        stream = NetworkImage(data.path).resolve(ImageConfiguration.empty);
      } else {
        stream = AssetImage(data.path).resolve(ImageConfiguration.empty);
      }
      ImageStreamListener listener;
      listener = ImageStreamListener((ImageInfo frame, bool synchronousCall) {
        ui.Image image = frame.image;
        stream.removeListener(listener);
        result.add(ClipResult.create(image, data.rect));
        if (result.length == paths.length) {
          completer.complete(result);
        }
      });
      stream.addListener(listener);
    }
    return completer.future;
  }

  static Rect calculateSizeForCover(double sourceWidth, double sourceHeight,
      double targetWidth, double targetHeight) {
    Rect result;

    double scaleWidth = sourceWidth / targetWidth;
    double scaleHeight = sourceHeight / targetHeight;
    double scaleMin = min(scaleWidth, scaleHeight);
    double actualWidth = sourceWidth / scaleMin;
    double actualHeight = sourceHeight / scaleMin;

    if (actualWidth > actualHeight) {
      double scale = (actualWidth - targetWidth) / 2 / actualWidth;
      result = Rect.fromLTRB(
          sourceWidth * scale, 0, sourceWidth * (1 - scale), sourceHeight);
    } else {
      double scale = (actualHeight - targetHeight) / 2 / actualHeight;
      result = Rect.fromLTRB(
          0, actualHeight * scale, sourceWidth, sourceHeight * (1 - scale));
    }

    return result;
  }

  static Rect calculateSizeByTarget(double sourceWidth, double sourceHeight,
      double targetWidth, double targetHeight, Rect target) {
    Rect result = calculateSizeForCover(
        sourceWidth, sourceHeight, targetWidth, targetHeight);
    double leftScale = target.left / targetWidth;
    double topScale = target.top / targetHeight;
    double rightScale = target.right / targetWidth;
    double bottomScale = target.bottom / targetHeight;
    return Rect.fromLTRB(
        result.left + result.width * leftScale,
        result.top + result.height * topScale,
        result.left + result.width * rightScale,
        result.top + result.height * bottomScale);
  }
}
