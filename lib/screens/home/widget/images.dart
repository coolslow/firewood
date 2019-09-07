import 'package:cached_network_image/cached_network_image.dart';
import 'package:firewood/common/utils/size_compat.dart';
import 'package:firewood/entity/recommend_entity.dart';
import 'package:firewood/entity/type_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ImageWidget extends StatelessWidget {
  final TypeEntity entity;

  ImageWidget(this.entity);

  @override
  Widget build(BuildContext context) {
    return _getImages(entity);
  }

  Widget _getImages(TypeEntity entity) {
    if (!(entity is RecommendEntity)) {
      return Container();
    }
    RecommendEntity data = entity as RecommendEntity;

    if (data.images == null || data.images.length == 0) {
      return Container();
    }

    int length = data.images.length;
    switch (length) {
      case 1:
        return _getImages1(data.images);
      case 4:
        return _getImages4(data.images);
      case 2:
      case 3:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      default:
        return _getImagesGrid(data.images);
    }
  }

  Widget _getImages1(List<String> entity) {
    double w = SizeCompat.width() * 0.67;
    double h = w / 1.77;

    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        left: SizeCompat.pxToDp(54),
        right: SizeCompat.pxToDp(54),
      ),
      width: SizeCompat.pxToDp(54) * 2 + w,
      height: h,
      child: ClipRRect(
        child: CachedNetworkImage(
          imageUrl: entity[0],
          width: w,
          height: h,
          fit: BoxFit.cover,
          placeholder: (BuildContext context, String url) {
            return Image.asset(
              "images/default_place_holder.png",
              fit: BoxFit.cover,
              width: w,
              height: h,
            );
          },
        ),
        borderRadius: BorderRadius.circular(SizeCompat.pxToDp(10)),
      ),
    );
  }

  Widget _getImages4(List<String> entity) {
    double itemSize = (SizeCompat.width() - SizeCompat.pxToDp(54.0 * 2)) / 3;

    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        left: SizeCompat.pxToDp(54),
      ),
      width: itemSize * 2,
      child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.all(0),
          physics: new NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: SizeCompat.pxToDp(10),
            crossAxisSpacing: SizeCompat.pxToDp(10),
            childAspectRatio: 1.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              child: CachedNetworkImage(
                imageUrl: entity[index],
                fit: BoxFit.cover,
                placeholder: (BuildContext context, String url) {
                  return Image.asset(
                    "images/default_place_holder.png",
                    fit: BoxFit.cover,
                    width: itemSize,
                    height: itemSize,
                  );
                },
              ),
//              child: FadeInImage.assetNetwork(
//                placeholder: "images/default_place_holder.png",
//                image: entity[index],
//                fit: BoxFit.cover,
//              ),
              borderRadius: BorderRadius.circular(SizeCompat.pxToDp(10)),
            );
          },
          itemCount: entity.length),
    );
  }

  Widget _getImagesGrid(List<String> entity) {
    return Container(
      padding: EdgeInsets.only(
        left: SizeCompat.pxToDp(54),
        right: SizeCompat.pxToDp(54),
      ),
      child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.all(0),
          physics: new NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: SizeCompat.pxToDp(10),
            crossAxisSpacing: SizeCompat.pxToDp(10),
            childAspectRatio: 1.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              child: CachedNetworkImage(
                imageUrl: entity[index],
                fit: BoxFit.cover,
                placeholder: (BuildContext context, String url) {
                  return Image.asset(
                    "images/default_place_holder.png",
                    fit: BoxFit.cover,
                  );
                },
              ),
//             child:  FadeInImage.assetNetwork(
//                placeholder: "images/default_place_holder.png",
//                image: entity[index],
//                fit: BoxFit.cover,
//              ),
              borderRadius: BorderRadius.circular(SizeCompat.pxToDp(10)),
            );
          },
          itemCount: entity.length),
    );
  }
}
