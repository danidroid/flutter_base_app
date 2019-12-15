
import 'dart:async';

import 'package:base/core/models/result_stream.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseAuthApi {

  login(String username, String password);

  logout();

  validateSession();

  get session;

  Stream<ResultStream> get onAuthListener;

  dispose();

}

mixin Auth implements BaseAuthApi {

  StreamController _onStream = BehaviorSubject<ResultStream>();

  @override
  login(String username, String passphrase) {

    _onStream.add(ResultStream(state: LoginState.loading));

    Future.delayed(Duration(milliseconds: 5000), () {
      _onStream.add(ResultStream(state: LoginState.success));
    });

  }

  @override
  logout() {
    _onStream.add(ResultStream(state: LoginState.logout));
  }

  @override
  validateSession() {

    _onStream.add(ResultStream(state: LoginState.request));
  }

  @override
  Stream<ResultStream> get onAuthListener => _onStream.stream;

  @override
  get session => null;

  @override
  dispose() {
    _onStream.close();
  }
}