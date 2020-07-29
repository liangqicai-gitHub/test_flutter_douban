
import 'package:flutter/material.dart';
import 'package:testdouban/feature/home/home_page.dart';
import 'package:testdouban/feature/message/message_page.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _page = [HomePage(),MessagePage()];
  final _bottomBars = [
    BottomNavigationBarItem(
      title: Text("首页"),
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      title: Text("消息"),
      icon: Icon(Icons.message),
    ),

  ];
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: _bottomBars,
          currentIndex: _index,
          onTap: (index) {
            setState(() {
              _index = index;
            });
          },
        ),
        body: IndexedStack(
          children: _page,
          index: _index,
        ),
      ),
    );
  }

}
