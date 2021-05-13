import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


class PostsLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (BuildContext ctx, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[200],
                    highlightColor: Colors.grey[300],
                    enabled: true,
                    direction: ShimmerDirection.ltr,
                    period: Duration(seconds: 1),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[200],
                              highlightColor: Colors.grey[300],
                              enabled: true,
                              direction: ShimmerDirection.ltr,
                              period: Duration(seconds: 1),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    width: index == 0
                                        ? context.width() / 1.50
                                        : index == 1
                                        ? context.width() / 2
                                        : context.width() / 2.50,
                                    height: 24,
                                    child: Container(color: Colors.grey[200]),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class PostLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[200],
            highlightColor: Colors.grey[300],
            enabled: true,
            direction: ShimmerDirection.ltr,
            period: Duration(seconds: 1),
            child: Container(
              margin: EdgeInsets.only(bottom: 5),
              width: context.width() / 2.50,
              height: 15,
              child: Container(color: Colors.grey[200]),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[200],
            highlightColor: Colors.grey[300],
            enabled: true,
            direction: ShimmerDirection.ltr,
            period: Duration(seconds: 1),
            child: Container(
              width: context.width(),
              height: 30,
              child: Container(color: Colors.grey[200]),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[200],
                  highlightColor: Colors.grey[300],
                  enabled: true,
                  direction: ShimmerDirection.ltr,
                  period: Duration(seconds: 1),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[200],
                            highlightColor: Colors.grey[300],
                            enabled: true,
                            direction: ShimmerDirection.ltr,
                            period: Duration(seconds: 1),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  width: index == 0 ? context.width() / 2 : context.width() / 2.50,
                                  height: 20,
                                  child: Container(color: Colors.grey[200]),
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ).py(10),
          Shimmer.fromColors(
            baseColor: Colors.grey[200],
            highlightColor: Colors.grey[300],
            enabled: true,
            direction: ShimmerDirection.ltr,
            period: Duration(seconds: 1),
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              width: context.width(),
              height: context.screenHeight * .20,
              child: Container(color: Colors.grey[200]),
            ),
          ),
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[200],
              highlightColor: Colors.grey[300],
              enabled: true,
              direction: ShimmerDirection.ltr,
              period: Duration(seconds: 1),
              child: Container(
                width: context.width(),
                height: context.screenHeight,
                child: Container(color: Colors.grey[200]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
