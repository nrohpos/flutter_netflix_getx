import 'package:flutter_netflix/model/Movie.dart';
import 'package:flutter_netflix/respository/home_respository.dart';
import 'package:flutter_netflix/screens/home/viewmodel/home_section.dart';
import 'package:get/get.dart';

class HomeViewModel {
  final _homeRespository = HomeRespository();
  List<Movie> trendingMovies = (List<Movie>.of([])).obs;
  var loadingMovies = false.obs;
  List<HomeSectionType> itemList = [
    HomeSectionType.netflix,
    HomeSectionType.trending,
    HomeSectionType.toprated,
    HomeSectionType.action,
    HomeSectionType.comedy,
    HomeSectionType.horror,
    HomeSectionType.romance,
    HomeSectionType.documentaries,
  ];

  void getTrendingMovies(
      {HomeSectionType homeSectionType = HomeSectionType.netflix}) async {
    trendingMovies = await _homeRespository.getTrendingMovies(
        onRequesting: (isRequesting) {
          loadingMovies(isRequesting);
        },
        homeSectionType: homeSectionType);
  }
}
