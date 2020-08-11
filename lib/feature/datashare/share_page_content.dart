


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SharePageContent1 extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Center(
      child: SharePageContentData(
        counter: 100,
        child: Column(
          children: <Widget>[
            _Card1(),
            _Card1(),
          ],
        ),
      ),
    );
  }
}



class _Card1 extends StatefulWidget {
  @override
  __Card1State createState() => __Card1State();
}

class __Card1State extends State<_Card1> {

  int changeTimes = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      print('okay!!!!!');
      changeTimes ++;
    });
  }


  @override
  Widget build(BuildContext context) {

    final s = context.dependOnInheritedWidgetOfExactType<SharePageContentData>();
//    final s = SharePageContentData.of(context);
    int realCount = s.counter;
    
    return FlatButton(
      child: Text('this is ${realCount}'),
//      color: realCount % 2 == 0 ? Colors.red : Colors.green,
      onPressed: () {
        setState(() {
          s.counter ++;
        });
        print('this is fuck...${s.counter}');
      },
    );

  }
}



class SharePageContentData extends InheritedWidget {

  int counter = 0;

  SharePageContentData({Widget child ,this.counter}): super(child: child);

  static SharePageContentData of(BuildContext content) {
    return content.dependOnInheritedWidgetOfExactType();
//    return content.dependOnInheritedWidgetOfExactType(aspect: SharePageContentData);
  }

  @override
  bool updateShouldNotify(SharePageContentData oldWidget) {
    return oldWidget.counter != counter;
  }

}
