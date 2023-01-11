import 'package:flutter_netflix/utils/util.dart';

enum FileType { png, svg, jpg }

var _imagePath = "images/";

extension FileImageUrl on String {
  String png() {
    return "$_imagePath${this}.${FileType.png.name}";
  }

  String path() {
    return "$_imagePath${this}";
  }

  String svg() {
    return "$_imagePath${this}.${FileType.svg.name}";
  }

  String pathFor({FileType type = FileType.png}) {
    return "$_imagePath${this}.${type.name}";
  }

  String? imgUrl() => "$IMG_URL$this";
}
