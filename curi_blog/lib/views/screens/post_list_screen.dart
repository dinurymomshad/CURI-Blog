import 'dart:math';

import 'package:curi_blog/state_manager/state/request_state.dart';
import 'package:curi_blog/views/global_widgets/loading_indicator.dart';
import 'package:curi_blog/views/styles/colors.dart';
import 'package:curi_blog/state_manager/provider/posts_provider.dart';
import 'package:curi_blog/views/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:velocity_x/velocity_x.dart';

import 'details_screen.dart';
import 'home_screen.dart';

class PostList extends ConsumerWidget {
  const PostList(this.categoryName, {Key key}) : super(key: key);
  final String categoryName;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final postsState = watch(postsByCategoryProvider.state);
    return Scaffold(
      backgroundColor: KColor.whiteColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () => context.pop(),
        ),
        iconTheme: IconThemeData(color: KColor.blackColor),
        backgroundColor: KColor.whiteColor,
        elevation: 1,
        title: Text(categoryName, style: KTextStyle.headline6),
      ),
      body: postsState is RequestLoadedState
          ? ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: postsState.responseObject.length,
              itemBuilder: (context, index) {
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
                        child: postsState.responseObject[index].featuredImage != 'false'
                            ? Image.network(
                                postsState.responseObject[index].featuredImage,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                          : null,
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
                            postsState.responseObject[index].title,
                            style: KTextStyle.body1.copyWith(fontWeight: FontWeight.bold),
                          ).pOnly(bottom: 5),
                          HtmlWidget(postsState.responseObject[index].excerpt.trim(), textStyle: KTextStyle.body2, enableCaching: true, webView: true)
                              .pOnly(bottom: 5),
                          Row(
                            children: [
                              Text(postsState.responseObject[index].author, style: KTextStyle.subtitle2).pOnly(right: 20),
                              Text(postsState.responseObject[index].published, style: KTextStyle.subtitle2),
                            ],
                          )
                        ],
                      ).p(10)
                    ],
                  ),
                ).pOnly(bottom: 20).onInkTap(() {
                  context.read(postProvider).post(postsState.responseObject[index].id);
                  context.nextPage(DetailsScreen(post: postsState.responseObject[index]));
                });
              }).p(16)
          : PostsLoadingIndicator().px(17),
    );
  }
}
