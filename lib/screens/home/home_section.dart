import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_netflix/custom/skeleton_horizontal.dart';
import 'package:flutter_netflix/screens/home/movie_item.dart';
import 'package:flutter_netflix/screens/home/viewmodel/home_section.dart';
import 'package:flutter_netflix/screens/home/viewmodel/home_viewmodel.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key, required this.homeSectionType})
      : super(key: key);
  final HomeSectionType homeSectionType;

  @override
  Widget build(BuildContext context) {
    var viewModel = HomeViewModel();
    viewModel.getTrendingMovies(homeSectionType: homeSectionType);
    return SizedBox(
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              homeSectionType.getTitle(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: Obx(() => viewModel.loadingMovies.value
                ? SkeletonHorizontal()
                : ListView.builder(
                    key: const PageStorageKey("homeKey"),
                    padding: const EdgeInsets.only(left: 16),
                    itemBuilder: ((context, index) {
                      var movie = viewModel.trendingMovies[index];
                      return MovieItem(
                        movie: movie,
                      );
                    }),
                    scrollDirection: Axis.horizontal,
                    itemCount: viewModel.trendingMovies.length,
                  )),
          ),
        ],
      ),
    );
  }
}
