import 'dart:math';

import 'package:flutter/material.dart';

class InterwinedAnimationBuilderPage extends StatefulWidget {
  static const routeName = '/InterwinedAnimationBuilderPage';
  @override
  _InterwinedAnimationBuilderPage createState() => _InterwinedAnimationBuilderPage();
}

class _InterwinedAnimationBuilderPage extends State<InterwinedAnimationBuilderPage>  with SingleTickerProviderStateMixin {


  AnimationController _controller;

  Animation _sizedAnimation;
  Animation _colorAnimation;
  Animation _opacityAnimation;
  Animation _radiansAnimaiton;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 5));
    CurvedAnimation ca = CurvedAnimation(parent: _controller,curve: Curves.fastOutSlowIn);

    _sizedAnimation = Tween(begin: 20.0,end: 200.0).animate(ca);
    _colorAnimation = ColorTween(begin: Colors.red, end:  Colors.black).animate(ca);
    _opacityAnimation = Tween(begin: 0.2,end: 1.0).animate(ca);
    _radiansAnimaiton = Tween(begin: 0.0,end: pi * 2).animate(ca);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('交织动画'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          AnimatedBuilder(
            animation: _controller,
            builder: (ctx,child) {
              return Opacity(
                opacity: _opacityAnimation.value,
                child: Transform(
                  alignment: Alignment.topCenter,
                  transform: Matrix4.rotationZ(_radiansAnimaiton.value),
                  child: Icon(Icons.favorite, size: _sizedAnimation.value, color: _colorAnimation.value,),
                ),
              );
            },
          ),

          Container(
            color: Colors.brown,
            child: Center(
                child: Text('this is text')
            ),
          ),
        ],
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
