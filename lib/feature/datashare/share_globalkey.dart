

import 'package:flutter/material.dart';
//import 'package:testdouban/feature/datashare/share_page_content.dart';
import 'package:testdouban/feature/datashare/share_page_content_provider.dart';


//我们一般把  ChangeNotifierProvider 写到顶层
class ShareGlobalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('数据分享_inheritedWidget'),
      ),
      body: SharePageContent12(),
//      body: SharePageContent1(), // inheritedWidgetbody: ,
    );
  }
}
