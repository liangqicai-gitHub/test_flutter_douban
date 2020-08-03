import 'package:flutter/material.dart';
import 'package:testdouban/feature/home/home_movie_item.dart';
import 'package:testdouban/models/api_response_entity.dart';
import 'package:testdouban/views/dash_line.dart';


class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {

  List<ApiResponseResult> movies = List<ApiResponseResult>();

  @override
  void initState() {
    super.initState();

    var newms = List<ApiResponseResult>();
    for (int i = 0; i < 1; i++) {
      final s = ApiResponseResult();
      newms.add(s);
    }

    setState(() {
      movies.addAll(newms);
    });
  }

  @override
  Widget build(BuildContext context) {
//    return LQCDashLine();
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (ctx, index) {
        return HomeMovieItem(movies[index]);
      },
    );
  }



}
