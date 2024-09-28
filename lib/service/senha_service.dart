import '../model/senha.dart';

class SenhaService {
  List<Senha> senhas = [];

  void senhar(Senha senha) {
    senhas.add(senha);
  }
}