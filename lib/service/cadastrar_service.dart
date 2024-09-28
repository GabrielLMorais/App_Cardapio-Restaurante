import '../model/cadastrar.dart';

class CadastrarService {
  List<Cadastrar> cadastros = [];

  void cadastrar(Cadastrar cadastro) {
    cadastros.add(cadastro);
  }
}