import 'package:flutter/material.dart';
import 'package:testdouban/feature/message/route_test_secondPage.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route'),
        backgroundColor: Colors.blue,
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            child: Text('Navigator.push'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (ctx) {
                  return RouteTestSecondPage();
                }
              ));
            },
          ),

          FlatButton(
            child: Text('Navigator.pushName'),
            onPressed: () {
              final future = Navigator.pushNamed(context, RouteTestSecondPage.routeName, arguments: 'this is argument');
              future.then((value) {
                if (value is String) {
                  print('$value');
                } else {
                  print("nothing call back");
                }
              });
            },
          ),

        ],
      ),
      
    );
  }
}

