import 'dart:async';

import 'package:netflix_app/login_mvc/login_model.dart';

class LoginPresenter {
  final formValidatorController = StreamController<bool>();

  Stream<bool> get isFormValidStream => formValidatorController.stream;

  void verifyForm(String? email, String? password) {
    final isValid = email != null && password != null;
    formValidatorController.sink.add(isValid);
  }

  submitForm(String email, String password){
    final model = LoginModel(email, password);
  }
}