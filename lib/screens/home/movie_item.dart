import 'package:flutter/material.dart';
import 'package:flutter_netflix/model/Movie.dart';
import 'package:get/get.dart';
import 'package:flutter_netflix/extension/string+extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_netflix/custom/skeleton_horizontal.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 2.2,
      margin: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () => {},
        child: CachedNetworkImage(
          imageUrl: movie.posterPath?.imgUrl() ?? "",
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => SkeletonHorizontal(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
