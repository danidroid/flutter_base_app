

import 'package:base/utils/svg.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  Animation<double> animation2;
  Animation<double> animation3;
  Animation<double> opacity;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.4, 1.0,
          curve: Curves.ease,
        ),
      ),
    );

    animation = Tween<double>(begin: 0, end: 25).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.15, 1.0,
        curve: Curves.fastOutSlowIn,
      ),
    ))
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });

    animation2 = Tween<double>(begin: 0, end: 50).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.25, 1.0,
        curve: Curves.fastOutSlowIn,
      ),
    ))
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });

    animation3 = Tween<double>(begin: 25, end: 75).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.5, 1.0,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    ))
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var center = (size.width / 2) - 20;
    var height = (size.height / 2);

    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Stack(
          children: <Widget>[
            Positioned(
                bottom: height,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Opacity(
                        opacity: opacity.value,
                        child: SvgIcons.c00),
                  ],
                )),
            Positioned(
                bottom: height + 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Opacity(
                        opacity: opacity.value,
                        child: SvgIcons.c01),
                  ],
                )),
            Positioned(
                bottom: height + animation2.value,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Opacity(
                        opacity: opacity.value,
                        child: SvgIcons.c02),
                  ],
                )),
            Positioned(
                bottom: height + animation3.value,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Opacity(
                        opacity: opacity.value,
                        child: SizedBox(
                            child: SvgIcons.c03)),
                  ],
                ))

          ],
        )
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}