import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:testdouban/feature/datashare/share_data_viewmodel.dart';
import 'myapp.dart';

void main() {
  runApp(
//    MultiProvider(
//      providers: [
//        ChangeNotifierProvider(
//          create: (BuildContext ctx) {
//            return HYCounterViewModel();
//          },
//        )
//      ],
//      child: MyApp(),
//    )

    ChangeNotifierProvider(
      create: (BuildContext ctx) {
        return HYCounterViewModel();
      },
      child: MyApp(),
    )
  );
}

