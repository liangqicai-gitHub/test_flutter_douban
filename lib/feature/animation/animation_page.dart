import 'package:flutter/material.dart';
import 'package:testdouban/feature/animation/animation_buider_page.dart';
import 'package:testdouban/feature/animation/animation_widget_page.dart';
import 'package:testdouban/feature/animation/hero_animation_page.dart';
import 'package:testdouban/feature/animation/intertwined_animation_page.dart';

class AnimationPage extends StatelessWidget {

  final heart = AnimationHeart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animaiton 最简单用法'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          heart,
          FlatButton(
            child: Text('Animation Widget'),
            onPressed: () {
              Navigator.pushNamed(context, AnimationWidgetPage.routeName);
            },
          ),

          FlatButton(
            child: Text('Animation Builder'),
            onPressed: () {
              Navigator.pushNamed(context, AnimationBuilderPage.routeName);
            },
          ),

          FlatButton(
            child: Text('交织动画'),
            onPressed: () {
              Navigator.pushNamed(context, InterwinedAnimationBuilderPage.routeName);
            },
          ),

          FlatButton(
            child: Text('hero动画'),
            onPressed: () {
              Navigator.pushNamed(context, HeroAnimationPage.routeName);
            },
          ),

        ],
      ),
    );
  }
}


/*****
 *  1、Animation: 抽象类
 *  * 监听动画值的改变
 *  * 监听动画状态的改变
 *  * value
 *  * status
 *  2、AnimationController
 *  3、CurvedAnimation
 *  4、Tween
 *
 *
 */
///
class AnimationHeart extends StatefulWidget {

  const AnimationHeart({
    Key key,
  }) : super(key: key);

  @override
  _AnimationHeartState createState() => _AnimationHeartState();
}

class _AnimationHeartState extends State<AnimationHeart> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _sizedAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 5),
    );

    final curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _sizedAnimation = Tween(begin: 50.0, end: 300.0).animate(curvedAnimation);

    _controller.addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
          onTap: () {

            if (_controller.isAnimating) {
              _controller.stop();
            } else {

              print('${_controller.status}');

              if (_controller.status == AnimationStatus.dismissed) {
                _controller.forward();
              } else if (_controller.status == AnimationStatus.forward) {
                _controller.forward();
              } else if (_controller.status == AnimationStatus.reverse) {
                _controller.reverse();
              } else if (_controller.status == AnimationStatus.completed) {
                _controller.reverse();
              }
            }


          },
          child: Icon(
            Icons.favorite,
            color: Colors.green,
            size: _sizedAnimation.value,
          ),
        )
    );
  }



}
