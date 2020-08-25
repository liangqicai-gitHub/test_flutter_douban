
import 'package:flutter/material.dart';
import 'package:testdouban/feature/animation/animation_page.dart';
import 'package:testdouban/feature/datashare/share_globalkey.dart';
import 'package:testdouban/feature/event_bus/event_bus_page.dart';
import 'package:testdouban/feature/home/home_page.dart';
import 'package:testdouban/feature/message/message_page.dart';
import 'package:testdouban/feature/routes/RouteConfig.dart';
import 'feature/gesture_and_sizefit/gesture_test_page.dart';


//EventBus bus = EventBus(sync: true);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _page = [HomePage(),MessagePage(),ShareGlobalPage(),GestureTestPage(),EventBusPage(),AnimationPage()];
  final _bottomBars = [
    BottomNavigationBarItem(
      title: Text("首页"),
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      title: Text("消息"),
      icon: Icon(Icons.message),
    ),
    BottomNavigationBarItem(
      title: Text("状态管理1"),
      icon: Icon(Icons.star),
    ),
    BottomNavigationBarItem(
      title: Text('手势'),
      icon: Icon(Icons.gesture),
    ),
    BottomNavigationBarItem(
      title: Text('evnetBus'),
      icon: Icon(Icons.layers_clear),
    ),
    BottomNavigationBarItem(
      title: Text('Animation'),
      icon: Icon(Icons.mood),
    ),
  ];
  var _index = 0;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      routes: RouteConfig.routes,
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
