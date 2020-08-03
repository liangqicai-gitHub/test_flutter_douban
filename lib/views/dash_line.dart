
import 'package:flutter/material.dart';

class LQCDashLine extends StatelessWidget {

  final Axis axis;
//  final double width;
  final double height;

  LQCDashLine({this.axis = Axis.horizontal, this.height = 1.0});

  @override
  Widget build(BuildContext context) {

    var ws = List<Widget>();
    final w = axis == Axis.horizontal ? 5.0 : height;
    final h = axis == Axis.horizontal ? height : 5.0;

//    int count = (width / ).toInt();
    for (int i = 0; i < 30;  i++) {
      ws.add(
          Expanded(
              child: Container(
                width: w,
                height: h,
                color: Colors.red,
              )
          )
      );

      ws.add(
          Expanded(
              child: SizedBox.fromSize(size: Size(w,h),)
          )
      );
    }

    ws.add(
        Expanded(
            child: Container(
              width: w,
              height: h,
              color: Colors.red,
            )
        )
    );

    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.center,
      children: ws,
    );
  }
}

//class _LQCDashLineState extends State<LQCDashLine> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Text('sdfdsf')
//    );
//  }
//}


//class Dsfasdf extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Text('sdfadsf'),
//    );
//  }
//}
