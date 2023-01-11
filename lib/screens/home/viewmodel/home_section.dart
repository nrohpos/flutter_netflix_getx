import 'package:flutter_netflix/utils/util.dart';

enum HomeSectionType {
  netflix,
  trending,
  toprated,
  action,
  comedy,
  horror,
  romance,
  documentaries;

  int getId() {
    switch (this) {
      case HomeSectionType.netflix:
        return 1;
      case HomeSectionType.trending:
        return 1;
      case HomeSectionType.toprated:
        return 1;
      case HomeSectionType.action:
        return 1;
      case HomeSectionType.comedy:
        return 1;
      case HomeSectionType.horror:
        return 1;
      case HomeSectionType.romance:
        return 1;
      case HomeSectionType.documentaries:
        return 1;
    }
  }

  String getEndPoint() {
    switch (this) {
      case HomeSectionType.netflix:
        return "3/trending/all/week";
      case HomeSectionType.trending:
      case HomeSectionType.toprated:
      case HomeSectionType.comedy:
      case HomeSectionType.horror:
      case HomeSectionType.romance:
      case HomeSectionType.documentaries:
      case HomeSectionType.action:
        return "3/discover/movie";
    }
  }

  //               Adventure -> 12
  //               Animation -> 16
  //               Crime -> 80
  //               Drama -> 18
  //               Family -> 10751
  //               Fantasy ->
  //               History -> 36
  //               Music -> 10402
  //               Mystery -> 9648
  //               Science_Fiction -> 878
  //               TV_Movie -> 10770
  //               Thriller -> 53
  //               War -> 10752
  //               Western -> 37
  //               BannerHome -> 9090
  //               MovieHome -> 9091
  //               Trending ->

  int getGenresCode() {
    switch (this) {
      case HomeSectionType.netflix:
        return 9092;
      case HomeSectionType.trending:
        return 12;
      case HomeSectionType.toprated:
        return 14;
      case HomeSectionType.action:
        return 28;
      case HomeSectionType.comedy:
        return 35;
      case HomeSectionType.horror:
        return 27;
      case HomeSectionType.romance:
        return 10749;
      case HomeSectionType.documentaries:
        return 99;
    }
  }

  dynamic getHeader(
      {int? page = null,
      int? withNetworks = null,
      String? language = null,
      String? query = null,
      int? id = null}) {
    switch (this) {
      case HomeSectionType.netflix:
        return {"api_key": API_KEY, "page": page};
      case HomeSectionType.trending:
      case HomeSectionType.toprated:
      case HomeSectionType.action:
      case HomeSectionType.comedy:
      case HomeSectionType.horror:
      case HomeSectionType.romance:
      case HomeSectionType.documentaries:
        return {
          "api_key": API_KEY,
          "page": (page ?? "1").toString(),
          "with_genres": getGenresCode().toString()
        };
    }
  }

  String getTitle() {
    switch (this) {
      case HomeSectionType.netflix:
        return "NETFLIX ORIGINALS";
      case HomeSectionType.trending:
        return "Trending Now";
      case HomeSectionType.toprated:
        return "Top Rated";
      case HomeSectionType.action:
        return "Action Movies";
      case HomeSectionType.comedy:
        return "Comedy Movies";
      case HomeSectionType.horror:
        return "Horror Movies";
      case HomeSectionType.romance:
        return "Romance Movies";
      case HomeSectionType.documentaries:
        return "Documentaries";
    }
  }
}
