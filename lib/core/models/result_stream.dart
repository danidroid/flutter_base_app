
enum LoginState {request, loading, success, fail, refresh, update, logout }

class ResultStream {

  LoginState state;

  dynamic model;

  ResultStream({this.state, this.model});
}