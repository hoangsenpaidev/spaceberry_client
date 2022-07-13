import 'dart:async';

import '../../validators/validations.dart';

class SignUpBloc {
  final StreamController _emailController = StreamController();
  final StreamController _passController = StreamController();
  final StreamController _rePassController = StreamController();
  final StreamController _usernameController = StreamController();

  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;
  Stream get rePassStream => _rePassController.stream;
  Stream get usernameStream => _usernameController.stream;

  bool isValidInfo(String email) {
    if (!Validations.isValidEmail(email)) {
      _emailController.sink.addError('Invalid email!');
      return false;
    }
    _emailController.sink.add('OK');

    return true;
  }

  bool isValidCompleteAccount(String username, String pass, String rePass) {
    if (!Validations.isValidUsername(username)) {
      _usernameController.sink.addError('Invalid username!');
      return false;
    }
    _usernameController.sink.add('OK');

    if (!Validations.isValidPass(pass)) {
      _passController.sink.addError('Invalid password!');
      return false;
    }
    _passController.sink.add('OK');

    if (pass != rePass) {
      _rePassController.sink.addError('Password incorrect!');
      return false;
    }
    _rePassController.sink.add('OK');

    return true;
  }

  void dispose() {
    _emailController.close();
    _passController.close();
    _usernameController.close();
  }
}
