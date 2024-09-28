import '../model/login.dart';

class LoginService {
  List<Login> logins = [];

  void logar(Login login) {
    logins.add(login);
  }
}