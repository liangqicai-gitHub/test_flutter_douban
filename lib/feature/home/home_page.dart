import 'package:flutter/material.dart';
import 'package:testdouban/feature/home/home_page_content.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return Text("home");
    return Scaffold(
      appBar: AppBar(
        title: Text('homePage'),
        backgroundColor: Colors.green,
      ),
      body: HomePageContent(),
    );
  }
}
