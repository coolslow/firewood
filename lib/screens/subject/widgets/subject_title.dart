import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class SubjectTitle extends StatefulWidget {
  String title;
  String des;

  SubjectTitle({this.title, this.des});

  @override
  State<StatefulWidget> createState() {
    return _SubjectTitleState();
  }
}

class _SubjectTitleState extends State<SubjectTitle> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(
              left: SizeCompat.pxToDp(Dimens.appEdgeEdge),
              right: SizeCompat.pxToDp(Dimens.appEdgeEdge),
            ),
            child: Text(widget.title,
                style: TextStyle(
                    color: Color(0xff191919),
                    fontSize: SizeCompat.pxToDp(50),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w600)),
          ),
          Expanded(
            child: Container(),
          ),
          getMore(),
        ]);
  }

  Widget getMore() {
    if (widget.des == null || widget.des == "") {
      return Container();
    } else {
      return Row(
        children: <Widget>[
          Text(
            widget.des,
            style: TextStyle(
                color: Color(0xff191919),
                fontSize: SizeCompat.pxToDp(36),
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding:
                EdgeInsets.only(right: SizeCompat.pxToDp(Dimens.appEdgeEdge)),
            child: Image.asset(
              "images/ic_arrow_forward.png",
              width: SizeCompat.pxToDp(36),
              height: SizeCompat.pxToDp(36),
              color: Color(0xff191919),
              colorBlendMode: BlendMode.srcATop,
            ),
          )
        ],
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
