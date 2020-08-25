import 'package:flutter/material.dart';

class AnimationWidgetPage extends StatefulWidget {

  static const routeName = '/AnimationWidgetPage';

  @override
  _AnimationWidgetPageState createState() => _AnimationWidgetPageState();
}

class _AnimationWidgetPageState extends State<AnimationWidgetPage> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _sizedAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 5));
    CurvedAnimation ca = CurvedAnimation(parent: _controller,curve: Curves.easeInOutCubic);
    _sizedAnimation = Tween(begin: 20.0,end: 200.0).animate(ca);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimationWidget的用法'),),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Align(
          alignment: Alignment.topCenter,
          child: MyAnimationWidget(_sizedAnimation),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('begin'),
        onPressed: () {
          if (_controller.status == AnimationStatus.dismissed) {
            _controller.forward();
          } else if (_controller.status == AnimationStatus.completed) {
            _controller.reverse();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}

class MyAnimationWidget extends AnimatedWidget {

  final Animation _animation;
  MyAnimationWidget(this._animation): super(listenable: _animation);


  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite,
      size: _animation.value,
      color: Colors.brown,
    );
  }

}
