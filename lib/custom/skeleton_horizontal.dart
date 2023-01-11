import 'package:flutter/material.dart';
import 'package:loading_skeleton_niu/loading_skeleton.dart';
import 'package:get/get.dart';

class SkeletonHorizontal extends StatelessWidget {
  const SkeletonHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingSkeleton(
      width: Get.width / 2.2,
      height: 180,
      colors: const [Colors.white, Colors.grey],
      animationEnd: AnimationEnd.EXTREMELY_ON_TOP,
    );
  }
}
