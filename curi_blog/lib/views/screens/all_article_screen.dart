import 'package:curi_blog/state_manager/provider/posts_provider.dart';
import 'package:curi_blog/state_manager/provider/scroll_provider.dart';
import 'package:curi_blog/state_manager/state/posts_state.dart';
import 'package:curi_blog/state_manager/state/scroll_state.dart';
import 'package:curi_blog/views/global_widgets/global_widgets.dart';
import 'package:curi_blog/views/styles/colors.dart';
import 'package:curi_blog/views/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import 'details_screen.dart';

class AllArticleScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final scrollControllerProvider = watch(allArticleScrollProvider);
    return ProviderListener(
      provider: allArticleScrollProvider.state,
      onChange: (context, state) {
        if (state is ScrollReachedBottomState) {
          context.read(postsProvider).getMorePosts();
        }
      },
      child: Scaffold(
        backgroundColor: KColor.whiteColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            onPressed: () => context.pop(),
          ),
          iconTheme: IconThemeData(color: KColor.blackColor),
          backgroundColor: KColor.whiteColor,
          elevation: 0,
          title: Text("All Article", style: KTextStyle.headline6),
        ),
        body: RefreshIndicator(
          onRefresh: () => context.read(postsProvider).posts(),
          child: SingleChildScrollView(
            controller: scrollControllerProvider.controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Recent post
                Consumer(
                  builder: (context, watch, _) {
                    final postsState = watch(postsProvider.state);

                    return postsState is PostsLoadedState
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: postsState.posts.length,
                            itemBuilder: (context, index) {
                              return PostCard(postsState: postsState, index: index).pOnly(bottom: 20).onInkTap(() {
                                context.read(postProvider).post(postsState.posts[index].id);
                                context.nextPage(DetailsScreen(post: postsState.posts[index]));
                              });
                            })
                        : PostsLoadingIndicator();
                  },
                ).px(17),
              ],
            ).pOnly(top: 10),
          ),
        ),
      ),
    );
  }
}
