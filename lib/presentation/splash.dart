

import 'package:base/core/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var bloc = Provider.of<BaseController>(context);

    return Scaffold(
        appBar: AppBar(
        title: Text("Demo"),
    ),
    body: Column(
      children: <Widget>[
        Spacer(),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: RaisedButton(
                  child: Text("Login"),
                  onPressed: () {
                    bloc.login("a", "a");
                  },
                ),
              ),
            ),
          ],
        ),
        Spacer(),
      ],
    ));
  }

}