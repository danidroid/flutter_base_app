

import 'package:base/core/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  GlobalKey _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    var bloc = Provider.of<BaseController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _key,
            child: Column(
              children: <Widget>[
                TextFormField(),
                TextFormField(),
                RaisedButton(
                  child: Text("Login"),
                  onPressed: () {
                    bloc.login("a", "b");
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}