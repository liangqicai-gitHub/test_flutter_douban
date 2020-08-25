import 'package:flutter/material.dart';

class AnimationBuilderPage extends StatefulWidget {
  static const routeName = '/AnimationBuilderPage';
  @override
  _AnimationBuilderPageState createState() => _AnimationBuilderPageState();
}

class _AnimationBuilderPageState extends State<AnimationBuilderPage>  with SingleTickerProviderStateMixin {


  AnimationController _controller;
  Animation _sizedAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 5));
    CurvedAnimation ca = CurvedAnimation(parent: _controller,curve: Curves.fastOutSlowIn);
    _sizedAnimation = Tween(begin: 20.0,end: 200.0).animate(ca);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedBuilder的用法'),),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Align(
          alignment: Alignment.topCenter,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (ctx,child) {
              return Icon(Icons.favorite, size: _sizedAnimation.value, color: Colors.red,);
            },
          ),
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
