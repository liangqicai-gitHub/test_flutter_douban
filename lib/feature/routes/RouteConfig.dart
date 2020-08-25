
import 'package:testdouban/feature/animation/animation_buider_page.dart';
import 'package:testdouban/feature/animation/animation_widget_page.dart';
import 'package:testdouban/feature/animation/hero_animation_page.dart';
import 'package:testdouban/feature/animation/intertwined_animation_page.dart';
import 'package:testdouban/feature/message/route_test_secondPage.dart';

class RouteConfig {
  static final routes = {
    RouteTestSecondPage.routeName : (ctx) => RouteTestSecondPage(),
    AnimationWidgetPage.routeName : (ctx) => AnimationWidgetPage(),
    AnimationBuilderPage.routeName: (ctx) => AnimationBuilderPage(),
    InterwinedAnimationBuilderPage.routeName: (ctx) => InterwinedAnimationBuilderPage(),
    HeroAnimationPage.routeName: (ctx) => HeroAnimationPage(),
  };
}

