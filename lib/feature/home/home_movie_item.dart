import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testdouban/models/api_response_entity.dart';
import 'package:testdouban/views/dash_line.dart';

class HomeMovieItem extends StatelessWidget {
  final ApiResponseResult cellModel;
  HomeMovieItem(this.cellModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),

      decoration: BoxDecoration(
//        color: Colors.blue,
        border: Border(
          bottom: BorderSide(
            width: 10,
            color: Colors.red,
          ),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildHeaderRanking(),
          SizedBox(height: 8),
          buildContent(),
          SizedBox(height: 8),
        ],
      ),

    );
  }

  //有圆角，有背景，这个时候用decoration，decoration 和 color 是冲突的
  Widget buildHeaderRanking() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      constraints: BoxConstraints(minWidth: 10, maxHeight: double.infinity),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Text(
        'No.111',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }


  Size _getTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  Widget buildContent() {



//    final info = buildContentInfo();
//    final ss

    final imageurl = 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1596434798039&di=683c7053ff2d41aab36f327ce1aff8c3&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Ftransform%2F20150916%2Fdsfa-fxhupin3606154.jpg';

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        
        children: <Widget>[
          buildContentImage(imageurl),
          SizedBox(width: 8),
          Expanded(
              child: IntrinsicHeight(
                child: Row(
                    children: [
                      Expanded(child: buildContentInfo()),
                      SizedBox(width: 8),
                      LQCDashLine(axis: Axis.vertical,height: 0.5),
                      SizedBox(width: 8),
                      Container(
                        width: 50,
//                        height: 600,
                        color: Colors.red,
                      )
                    ],
                ),


              )
          ),
//          SizedBox(width: 8),
//          LQCDashLine(axis: Axis.vertical,width: 100,height: 0.5,),
//          SizedBox(width: 8),
//          Container(
//            width: 100,
//            height: 10,
//            color: Colors.red,
////            child: Text('AA'),
//          ),
        ],
      ),
    );
  }


  ClipRRect buildContentImage(String imageurl) {
    return ClipRRect(
      child: Image.network(
        imageurl,
        height: 150,
        width: 70,
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(8),
    );
  }

  Widget buildContentInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildContentTitle(),
      ],
    );
  }



  RichText buildContentTitle() {
    return RichText(
//      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              Icons.play_circle_filled,
              size: 50,
              color: Colors.green,
            ),
//            baseline: TextBaseline.ideographic,
            alignment: PlaceholderAlignment.middle
          ),

          ...'11111111111111111111111111111111111111111111111111(2990)'.runes.map((e) {

            final text = String.fromCharCode(e);
            return WidgetSpan(
              alignment: text == '1' ? PlaceholderAlignment.middle : PlaceholderAlignment.bottom,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: text == '1' ? 20 : 10,
                  color: text == '1' ? Colors.black : Colors.grey
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );

  }
}
