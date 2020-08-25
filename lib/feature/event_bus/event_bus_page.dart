import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

EventBus bus = EventBus(sync: false);


class EventBusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('eventBus'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _EventBusPageFirstBtn(),
          SizedBox(height: 20,),
          _EventBusPageListener(),
        ],
      ),

      backgroundColor: Colors.black.withAlpha(50),
    );
  }
}



class UserInfoEvent {
  String username;
  String age;
}


class _EventBusPageFirstBtn extends StatefulWidget {
  const _EventBusPageFirstBtn({
    Key key,
  }) : super(key: key);

  @override
  __EventBusPageFirstBtnState createState() => __EventBusPageFirstBtnState();
}

class __EventBusPageFirstBtnState extends State<_EventBusPageFirstBtn> {
  
  int age = 10;
  
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('this is flatButton'),
      onPressed: () {
        age ++;
        final s = UserInfoEvent();
        s.username = 'wori';
        s.age = age.toString();
        print('this is age ${s.age}');
        bus.fire(s);
      },
    );
  }
}


class _EventBusPageListener extends StatefulWidget {
  const _EventBusPageListener({
    Key key,
  }) : super(key: key);

  @override
  __EventBusPageListenerState createState() => __EventBusPageListenerState();
}

class __EventBusPageListenerState extends State<_EventBusPageListener> {

  String age;

  @override
  void initState() {
    super.initState();
    bus.on<UserInfoEvent>().listen((event) {
      print('this is listen ${event.runtimeType}');
      setState(() {
        age = event.age;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('this is $age');
  }
}