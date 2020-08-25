import 'package:flutter/material.dart';

class HeroAnimationPage extends StatelessWidget {

  static const routeName = '/HeroAnimationPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HeroAnimation'),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 16.0/9.0,
          ),
          itemCount: 20,
          itemBuilder: (BuildContext context,int index) {
            final imageurl = 'https://picsum.photos/200/300?random=${index}';
            return GestureDetector(
              onTap: () {
                Navigator.push(context, PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 250),
                  pageBuilder: (ctx,a1,a2) {
                    return FadeTransition(
                      opacity: a1,
                      child: HeroAnimationSecondPage(imageurl),
                    );
                  },
                ));
              },

              child: Hero(
                tag: imageurl,
                child: Image.network(imageurl, fit: BoxFit.cover,),
              ),
            );
          }),
    );
  }
}


class HeroAnimationSecondPage extends StatelessWidget {

  final String imageUrl;

  HeroAnimationSecondPage(this.imageUrl);

  @override
  Widget build(BuildContext context) {

    final heroWidget = Hero(
      tag: imageUrl,
      child: Center(
        child: Image.network(
          imageUrl,
          width: 414.0,
          height: 414.0,
          fit: BoxFit.fill,
        ),
      ),
    );


    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: imageUrl.length > 0 ? heroWidget : null,
      ),
    );
  }
}
