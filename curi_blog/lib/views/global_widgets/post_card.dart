import 'dart:math';

import 'package:curi_blog/views/styles/colors.dart';
import 'package:curi_blog/views/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:velocity_x/velocity_x.dart';

class PostCard extends StatefulWidget {
  const PostCard({Key key, @required this.postsState, @required this.index, this.showExcerpt = true}) : super(key: key);

  final dynamic postsState;
  final int index;
  final bool showExcerpt;

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: new Duration(seconds: 2), vsync: this);
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: KColor.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3),
            color: KColor.categoryColor[Random().nextInt(KColor.categoryColor.length)].withOpacity(0.15),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: context.screenHeight * .30,
            width: context.screenWidth,
            child: widget.postsState.posts[widget.index].featuredImage != 'false'
                ? Image.network(
                    widget.postsState.posts[widget.index].featuredImage,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 1.5,
                          valueColor: animationController.drive(ColorTween(begin: Colors.blueAccent, end: Colors.red)),
                          /*value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                              : null,*/
                        ),
                      );
                    },
                  )
                : Image.network(
                    "https://www.sgpthorncliffe.com/wp-content/uploads/2016/08/jk-placeholder-image.jpg",
                    fit: BoxFit.cover,
                  ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.postsState.posts[widget.index].title,
                textScaleFactor: 1,
                maxLines: widget.showExcerpt ? null : 2,
                style: KTextStyle.body1.copyWith(fontWeight: FontWeight.bold),
              ).pOnly(bottom: 5),
              widget.showExcerpt
                  ? HtmlWidget(widget.postsState.posts[widget.index].excerpt.trim(), textStyle: KTextStyle.body2, enableCaching: true, webView: true)
                      .pOnly(bottom: 5)
                  : Container(),
              widget.showExcerpt
                  ? Row(
                      children: [
                        Text(widget.postsState.posts[widget.index].author, textScaleFactor: 1, style: KTextStyle.subtitle2).pOnly(right: 20),
                        Text(widget.postsState.posts[widget.index].published, textScaleFactor: 1, style: KTextStyle.subtitle2),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.postsState.posts[widget.index].author, textScaleFactor: 1, style: KTextStyle.subtitle2).pOnly(top: 10),
                        Text(widget.postsState.posts[widget.index].published, textScaleFactor: 1, style: KTextStyle.subtitle2),
                      ],
                    )
            ],
          ).p(10)
        ],
      ),
    );
  }
}
