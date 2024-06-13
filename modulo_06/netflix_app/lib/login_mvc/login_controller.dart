import 'dart:async';

import 'package:netflix_app/login_mvc/login_model.dart';

class LoginController {
  late final _emailController = StreamController<String>();
  late final _passwordController = StreamController<String>();
  late final _formValidatedController = StreamController<bool>();

  String? _email;
  String? _password;

  Stream<String> get emailStream => _emailController.stream
    ..listen(
      (email) {
        _email = email;
        _formListener();
      },
    );
  Stream<String> get passwordStream => _passwordController.stream
    ..listen((password) {
      _password = password;
      _formListener();
    });
  Stream<bool> get formValidatedStream => _formValidatedController.stream;

  void addEmail(String email) => _emailController.sink.add(email);
  void addPassword(String password) => _passwordController.sink.add(password);

  void _formListener() {
    final isFormValid = _email != null && _password != null;
    _formValidatedController.add(isFormValid);
  }

  submitForm(){
    final model = LoginModel(_email!, _password!);
  }
}
