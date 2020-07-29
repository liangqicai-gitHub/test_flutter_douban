import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:testdouban/models/api_response_entity.dart';
import 'package:testdouban/service/home_service.dart';

class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    ApiResponseEntity ss = ApiResponseEntity();
    ss.result = {};
    
    print('this is ${ss.converedResultAs<double>()}');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (ctx, index) {
        return ListTile(
          title: Text("index${index + 1}"),
          subtitle: Text("subtitle${index + 1}"),
        );
      },
    );
  }
}
