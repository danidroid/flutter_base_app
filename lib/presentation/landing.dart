

import 'package:base/core/controller/controller.dart';
import 'package:base/core/models/result_stream.dart';
import 'package:base/presentation/home.dart';
import 'package:base/presentation/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'loading.dart';
import 'login.dart';

class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var bloc = Provider.of<BaseController>(context);

    return StreamBuilder<ResultStream>(
        stream: bloc.onListener,
        builder: (_, AsyncSnapshot<ResultStream> snapshot){
          if (snapshot.connectionState == ConnectionState.active) {
            final ResultStream result = snapshot.data;

            print(result.state);

            if (result == null) {
              return Container();
            }

            switch(result.state) {
              case LoginState.request:
                {
                  return LoginPage();
                }
                break;
              case LoginState.success:

                return MyHomePage(title: "Home");

                break;
              case LoginState.fail:
                // TODO: Handle this case.
                break;
              case LoginState.refresh:
                // TODO: Handle this case.
                break;
              case LoginState.update:
                // TODO: Handle this case.
                break;
              case LoginState.logout:
                return SplashPage();
                break;
              case LoginState.loading:
                return LoadingPage();
                break;
            }
          }

          return SplashPage();
        }
    );
  }

}