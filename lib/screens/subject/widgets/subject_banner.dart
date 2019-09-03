import 'package:cached_network_image/cached_network_image.dart';
import 'package:firewood/common/constants.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:flutter/widgets.dart';

class SubjectBanner extends StatefulWidget {
  double _ratio;
  List<String> data;

  EdgeInsets padding = EdgeInsets.only(
    left: SizeCompat.pxToDp(Dimens.appEdgeEdge),
    right: SizeCompat.pxToDp(Dimens.appEdgeEdge),
  );

  SubjectBanner(
    this.data, {
    ratio = 3.5,
  }) {
    _ratio = ratio;
  }

  @override
  State<StatefulWidget> createState() {
    return _SubjectBannerState();
  }
}

class _SubjectBannerState extends State<SubjectBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(SizeCompat.pxToDp(10)),
        child: CachedNetworkImage(
          imageUrl: widget.data[0],
          width: SizeCompat.width(),
          height: SizeCompat.width() / widget._ratio,
          fit: BoxFit.cover,
          placeholder: (BuildContext context, String url) {
            return Image.asset("images/default_place_holder.png");
          },
        ),
      ),
//
    );
  }
}
