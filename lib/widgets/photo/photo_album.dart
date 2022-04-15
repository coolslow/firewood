import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class PhotoAlbum extends StatefulWidget {
  List<String> data = [];

  double size = 0;
  double mainAxisSpacing = 10;
  double crossAxisSpacing = 10;
  int crossAxisCount = 3;
  double childAspectRatio = 1;
  EdgeInsetsGeometry padding = EdgeInsetsGeometry.infinity;
  BorderRadius borderRadius = BorderRadius.zero;
  int maxCount = 9;
  bool showDustbin = false;
  bool showWhenEmpty = false;

  PhotoAlbum({
    required List<String> data,
    required double size,
    required double mainAxisSpacing,
    required double crossAxisSpacing,
    required int crossAxisCount,
    double childAspectRatio = 1,
    required EdgeInsetsGeometry padding,
    required BorderRadius borderRadius,
    int maxCount = 9,
    required bool showDustbin,
    required bool showWhenEmpty,
  }) {
    this.size = size;
    this.mainAxisSpacing = mainAxisSpacing;
    this.crossAxisSpacing = crossAxisSpacing;

    this.crossAxisCount = crossAxisCount;
    this.childAspectRatio = childAspectRatio;
    this.padding = padding;
    this.borderRadius = borderRadius;

    this.maxCount = maxCount;
    this.showDustbin = showDustbin;
    this.showWhenEmpty = showWhenEmpty;

    this.data = data;
  }

  @override
  State<StatefulWidget> createState() {
    return _PhotoAlbumState();
  }
}

class _PhotoAlbumState extends State<PhotoAlbum> {
  late double itemWith;
  late double itemHeight;

  @override
  void initState() {
    itemWith =
        (widget.size - (widget.crossAxisCount - 1) * widget.crossAxisSpacing) /
            widget.crossAxisCount;
    itemHeight = itemWith / widget.childAspectRatio;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int itemCount = 0;
    if (widget.showWhenEmpty) {
      itemCount = widget.data.length >= widget.maxCount
          ? widget.maxCount
          : widget.data.length + 1;
    } else {
      if (widget.data.length == 0) {
        itemCount = 0;
      } else {
        itemCount = widget.data.length >= widget.maxCount
            ? widget.maxCount
            : widget.data.length + 1;
      }
    }
    return Container(
      width: widget.size,
      child: GridView.builder(
          shrinkWrap: true,
          padding: widget.padding,
          physics: new NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.crossAxisCount,
            mainAxisSpacing: widget.mainAxisSpacing,
            crossAxisSpacing: widget.crossAxisSpacing,
            childAspectRatio: widget.childAspectRatio,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: <Widget>[
              getItemView(index),
              Positioned(
                top: 0,
                right: 0,
                child: getDeleteView(index),
              ),
            ]);
          },
          itemCount: itemCount),
    );
  }

  Widget getDeleteView(int index) {
    if (!widget.showDustbin || index == widget.data.length) {
      return Container();
    }
    return GestureDetector(
      onTap: () {
        print("删除图片 index=$index");
        setState(() {
          widget.data.removeAt(index);
        });
      },
      child: Container(
        width: itemWith / 6,
        height: itemWith / 6,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(0x771a1a1a),
            borderRadius: BorderRadius.only(
                topRight: widget.borderRadius.topRight,
                bottomLeft: widget.borderRadius.bottomLeft)),
        child: Image.asset(
          "images/ic_dustbin.png",
          fit: BoxFit.cover,
          width: itemWith / 6 * 0.5,
          height: itemWith / 6 * 0.5,
          color: Colors.white,
          colorBlendMode: BlendMode.srcATop,
        ),
      ),
    );
  }

  Widget getItemView(int index) {
    if (index == widget.data.length) {
      return GestureDetector(
        onTap: () {
          print("添加图片");
          setState(() {
            widget.data.add(
                "https://img3.doubanio.com/view/note/l/public/p53288890.jpg");
          });
        },
        child: Container(
          height: itemHeight,
          width: itemWith,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: widget.borderRadius,
              border: Border.all(color: Color(0xff9f9f9f), width: 1)),
          child: Image.asset(
            "images/ic_add.png",
            fit: BoxFit.cover,
            width: itemWith / 4,
            height: itemHeight / 4,
            color: Color(0xff9f9f9f),
            colorBlendMode: BlendMode.srcATop,
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          print("大图预览 index=$index");
        },
        child: ClipRRect(
          child: CachedNetworkImage(
            imageUrl: widget.data[index],
            fit: BoxFit.cover,
            height: itemHeight,
            width: itemWith,
            placeholder: (BuildContext context, String url) {
              return Image.asset(
                "images/default_place_holder.png",
                fit: BoxFit.cover,
                height: itemHeight,
                width: itemWith,
              );
            },
          ),
          borderRadius: widget.borderRadius,
        ),
      );
    }
  }
}
