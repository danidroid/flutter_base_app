

import 'package:base/core/models/result_stream.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../api/auth_api.dart';

abstract class BaseCore {

  dispose();

  Stream<ResultStream> get onListener;
}

mixin Core implements BaseCore {

  @override
  dispose() {

  }

}

abstract class BaseController with BaseCore, BaseAuthApi, ChangeNotifier {


}

class Controller extends BaseController
    with
        Core,
        Auth {

  Controller() {
    init();
  }

  init() {
    validateSession();
  }

  @override
  Stream<ResultStream> get onListener => Observable.merge([
    onAuthListener
  ]);

}

