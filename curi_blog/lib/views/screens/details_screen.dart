import 'dart:math';
import 'package:curi_blog/data/models/posts/posts.dart';
import 'package:curi_blog/state_manager/provider/posts_provider.dart';
import 'package:curi_blog/state_manager/state/request_state.dart';
import 'package:curi_blog/views/global_widgets/global_widgets.dart';
import 'package:curi_blog/views/styles/colors.dart';
import 'package:curi_blog/views/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailsScreen extends ConsumerWidget {
  final Posts post;

  const DetailsScreen({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final postState = watch(postProvider.state);
    return Scaffold(
      backgroundColor: KColor.whiteColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () => context.pop(),
        ),
        iconTheme: IconThemeData(color: KColor.blackColor),
        backgroundColor: KColor.whiteColor,
        elevation: 0,
        actions: [
          CircleAvatar(
            radius: 18,
            foregroundColor: KColor.whiteColor,
            backgroundColor: KColor.categoryColor[Random().nextInt(KColor.categoryColor.length)],
            child: Icon(Icons.bookmark_border),
          ).pOnly(right: 16).onInkTap(() {
            toast(
              'Add to favorite feature coming soon!',
              textColor: KColor.whiteColor,
              bgColor: KColor.blackColor,
            );
          }),
        ],
      ),
      body: postState is RequestLoadedState
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.category,
                    style: KTextStyle.body2
                        .copyWith(fontWeight: FontWeight.w500, color: KColor.categoryColor[Random().nextInt(KColor.categoryColor.length)]),
                  ).pOnly(bottom: 10).px(16),
                  Text(
                    postState.responseObject.postTitle,
                    style: KTextStyle.headline5.copyWith(fontWeight: FontWeight.w500),
                  ).pOnly(bottom: 15).px(16),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        foregroundColor: KColor.whiteColor,
                        backgroundColor: KColor.categoryColor[Random().nextInt(KColor.categoryColor.length)],
                        child: Icon(Icons.person),
                      ).pOnly(right: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(postState.responseObject.authorName, style: KTextStyle.button).pOnly(bottom: 5),
                          Text('${DateFormat.yMMMMEEEEd().format(DateTime.parse(postState.responseObject.postDate))}', style: KTextStyle.subtitle2),
                        ],
                      )
                    ],
                  ).pOnly(bottom: 15).px(16),
                  Container(
                    width: context.screenWidth,
                    child: Image.network(
                      post.featuredImage == 'false'
                          ? "https://www.sgpthorncliffe.com/wp-content/uploads/2016/08/jk-placeholder-image.jpg"
                          : post.featuredImage,
                      fit: BoxFit.cover,
                    ).pOnly(bottom: 10),
                  ),
                  HtmlWidget(
                    postState.responseObject.postContent,
                    textStyle: KTextStyle.body1,
                    enableCaching: true,
                    webView: true,
                  ).pOnly(bottom: 5).px(16),
                ],
              ),
            )
          : PostLoadingIndicator().p(17),
    );
  }
}
