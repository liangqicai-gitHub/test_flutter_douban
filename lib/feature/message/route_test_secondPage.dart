

import 'package:flutter/material.dart';

class RouteTestSecondPage extends StatelessWidget {

  static final String routeName = '/RouteTestSecondPage';

  @override
  Widget build(BuildContext context) {

    String s;
    if (ModalRoute.of(context).settings.arguments is String) {
      s = ModalRoute.of(context).settings.arguments;
    }


    return Scaffold(
      appBar: _RouteTestAppBar(
        backBlock: () {
          Navigator.pop(context);
        },
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context, 'this is message');
        },
        child: Text('${s}'),
      ),
    );
  }
}



//typedef _RouteTestAppBar = void 

class _RouteTestAppBar extends StatelessWidget implements PreferredSizeWidget {

  final void Function() backBlock;

  const _RouteTestAppBar({Key key, this.backBlock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final safeTop = MediaQuery.of(context).padding.top;
    return Container(
      color: Colors.green,
      height: safeTop + preferredSize.height,
      child: Padding(
        padding: EdgeInsets.only(top: safeTop),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: GestureDetector(
                  onTap: backBlock ?? (){},
                  child: Text('Back'),
                ),
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: Text(
                'this is title',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),
              )
            ),

          ],
        ),
      ),

    );




  }
  @override
  Size get preferredSize {
    return Size.fromHeight(56);
  }
}
