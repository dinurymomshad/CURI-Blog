import 'dart:math';

import 'package:curi_blog/state_manager/provider/categories_provider.dart';
import 'package:curi_blog/state_manager/provider/posts_provider.dart';
import 'package:curi_blog/views/styles/colors.dart';
import 'package:curi_blog/views/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:curi_blog/constants/k_strings.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:curi_blog/views/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
    Future.delayed(Duration(seconds: 1), () => context.nextReplacementPage(HomeScreen()));
  }

  void fetchData() {
    context.read(categoriesProvider).categories();
    context.read(postsProvider).posts();
    context.read(featuredPostsProvider).featuredPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.whiteColor,
      body: Container(
        //color: KColor.categoryColor[Random().nextInt(KColor.categoryColor.length)].withOpacity(0.15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/Loading.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
