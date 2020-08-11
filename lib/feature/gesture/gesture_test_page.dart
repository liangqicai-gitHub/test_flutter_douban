import 'package:flutter/material.dart';

class GestureTestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture test'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PointerTest(),
          GestureDetector(
            onTap: () {
              print('outter tap');
            },
            child: Container(
              width: double.infinity,
              height: 200,
              color: Colors.green,
              alignment: Alignment(-1 + 0.1,-1 + 0.1),
              child: GestureDetector(
                onTap: () {
                  print('inner click');
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PointerTest extends StatelessWidget {
  const PointerTest({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        print('onPointerDown ${event.position}    ${event.localPosition}');
      },
      onPointerMove: (event) {
        print('onPointerMove ${event.position}    ${event.localPosition}');
      },
      onPointerUp: (event) {
        print('onPointerUp ${event.position}    ${event.localPosition}');
      },
      onPointerCancel: (event) {
        print('onPointerCancel ${event.position}    ${event.localPosition}');
      },
      child: Container(
        child: FittedBox(
          alignment: Alignment.topLeft,
          child: Text(
            'sdfasdf55555555557',
            style: TextStyle(fontSize: 90,color: Colors.black),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        width: double.infinity,
        height: 50,
        color: Colors.yellow,
      ),
    );
  }
}
