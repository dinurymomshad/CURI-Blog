import 'dart:math';
import 'package:curi_blog/state_manager/provider/categories_provider.dart';
import 'package:curi_blog/state_manager/provider/posts_provider.dart';
import 'package:curi_blog/state_manager/state/posts_state.dart';
import 'package:curi_blog/state_manager/state/request_state.dart';
import 'package:curi_blog/views/global_widgets/global_widgets.dart';
import 'package:curi_blog/views/screens/details_screen.dart';
import 'package:curi_blog/views/screens/post_list_screen.dart';
import 'package:curi_blog/views/styles/colors.dart';
import 'package:curi_blog/views/styles/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'all_article_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.whiteColor,
      appBar: AppBar(
        leading: Icon(Icons.book),
        iconTheme: IconThemeData(color: KColor.blueColor.withOpacity(0.50)),
        backgroundColor: KColor.whiteColor,
        elevation: 0,
        actions: [
          CircleAvatar(
            radius: 18,
            foregroundColor: KColor.whiteColor,
            backgroundColor: KColor.categoryColor[Random().nextInt(KColor.categoryColor.length)],
            child: Icon(Icons.person).onInkTap(() {
              toast(
                'User login feature coming soon!',
                textColor: KColor.whiteColor,
                bgColor: KColor.blackColor,
              );
            }),
          ).pOnly(right: 16),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => context.read(postsProvider).posts(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header Text
              RichText(
                text: TextSpan(text: 'Let\'s', style: KTextStyle.headline4, children: <TextSpan>[
                  TextSpan(
                    text: '\nRead a blog',
                    style: KTextStyle.headline4.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ]),
              ).px(17),

              /// Search Bar
              Container(
                color: KColor.blackColorLight.withOpacity(0.05),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  enabled: false,
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: KTextStyle.subtitle1,
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: KColor.blackColorLight,
                      )),
                ).onInkTap(() {
                  toast(
                    'Search feature coming soon!',
                    textColor: KColor.whiteColor,
                    bgColor: KColor.blackColor,
                  );
                }),
              ).cornerRadius(5).pOnly(top: 20).px(17),

              /// Category
              Consumer(
                builder: (context, watch, child) {
                  final categoriesState = watch(categoriesProvider.state);
                  Random _random = Random();
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Category",
                              style: KTextStyle.headline6.copyWith(
                                color: KColor.blackColor,
                                fontWeight: FontWeight.bold,
                              )),
                          categoriesState is RequestLoadedState
                              ? Container()
                              : IconButton(
                                  onPressed: () => context.read(categoriesProvider).categories(),
                                  icon: Icon(Icons.refresh),
                                  visualDensity: VisualDensity.compact,
                                )
                        ],
                      ).px(17).pOnly(bottom: 10),

                      /// Category Slider
                      categoriesState is RequestLoadedState
                          ? Container(
                              height: 50,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: categoriesState.responseObject.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: EdgeInsets.all(10),
                                      color: KColor.categoryColor[_random.nextInt(KColor.categoryColor.length)].withOpacity(0.75),
                                      child: Center(
                                          child: Text(
                                        categoriesState.responseObject[index].name,
                                        style: KTextStyle.button.copyWith(color: KColor.whiteColor),
                                      )),
                                    ).cornerRadius(10).pOnly(right: 10).onInkTap(() {
                                      context.read(postsByCategoryProvider).postsByCategory(categoriesState.responseObject[index].id);
                                      context.nextPage(PostList(categoriesState.responseObject[index].name));
                                    });
                                  }),
                            ).pOnly(left: 17)
                          : Container(
                              height: 50,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (BuildContext ctx, int index) {
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey[200],
                                      highlightColor: Colors.grey[300],
                                      enabled: true,
                                      direction: ShimmerDirection.ltr,
                                      period: Duration(seconds: 1),
                                      child: Container(
                                        height: 50,
                                        width: 100,
                                        color: Colors.white,
                                      ).cornerRadius(10).pOnly(right: 10),
                                    );
                                  }),
                            ).pOnly(left: 17)
                    ],
                  ).pOnly(top: 20);
                },
              ),

              /// Featured
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Featured", style: KTextStyle.headline6.copyWith(color: KColor.blackColor, fontWeight: FontWeight.bold)),
                      /*TextButton(
                        style: ButtonStyle(visualDensity: VisualDensity.compact),
                        child: Text("View all", style: KTextStyle.subtitle2),
                        onPressed: () => context.nextPage(AllArticleScreen()),
                      ),*/
                    ],
                  ).pOnly(left: 17),

                  /// Featured Post List
                  Consumer(
                    builder: (context, watch, _) {
                      final postsState = watch(featuredPostsProvider.state);

                      return postsState is FeaturedPostsLoadedState
                          ? Container(
                              height: context.screenHeight * .50,
                              width: context.screenWidth,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(top: 10),
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: postsState.posts.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: context.screenWidth * .80,
                                      child: PostCard(postsState: postsState, index: index, showExcerpt: false).pOnly(bottom: 20, left: 17, right: 17).onInkTap(() {
                                        context.read(postProvider).post(postsState.posts[index].id);
                                        context.nextPage(DetailsScreen(post: postsState.posts[index]));
                                      }),
                                    );
                                  }),
                            )
                          : PostsLoadingIndicator().px(17);
                    },
                  )
                ],
              ).pOnly(top: 20),

              /// Recent post
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Latest", style: KTextStyle.headline6.copyWith(color: KColor.blackColor, fontWeight: FontWeight.bold)),
                      TextButton(
                        style: ButtonStyle(visualDensity: VisualDensity.compact),
                        child: Text("View all", style: KTextStyle.subtitle2),
                        onPressed: () => context.nextPage(AllArticleScreen()),
                      ),
                    ],
                  ),

                  /// Post List
                  Consumer(
                    builder: (context, watch, _) {
                      final postsState = watch(postsProvider.state);

                      return postsState is PostsLoadedState
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: postsState.posts.length > 10 ? 10 : postsState.posts.length,
                              itemBuilder: (context, index) {
                                return PostCard(postsState: postsState, index: index).pOnly(bottom: 20).onInkTap(() {
                                  context.read(postProvider).post(postsState.posts[index].id);
                                  context.nextPage(DetailsScreen(post: postsState.posts[index]));
                                });
                              })
                          : PostsLoadingIndicator();
                    },
                  )
                ],
              ).pOnly(top: 20).px(17),
            ],
          ).pOnly(top: 10),
        ),
      ),
    );
  }
}
