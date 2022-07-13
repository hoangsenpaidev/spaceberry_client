import 'dart:async';

import '../../validators/validations.dart';

class LoginBloc {
  final StreamController _emailController = StreamController();
  final StreamController _passController = StreamController();

  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;

  bool isValidInfo(String email, String pass) {
    if (!Validations.isValidEmail(email)) {
      _emailController.sink.addError('Invalid email!');
      return false;
    }
    _emailController.sink.add('OK');

    if (!Validations.isValidPass(pass)) {
      _passController.sink.addError('Invalid password!');
      return false;
    }
    _passController.sink.add('OK');

    return true;
  }

  void dispose() {
    _emailController.close();
    _passController.close();
  }
}
