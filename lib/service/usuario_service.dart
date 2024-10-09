import 'package:app_cardapio_restaurante/model/login.dart';
import '../model/cadastro.dart';

class UsuarioService {
  List<Cadastro> usuarios = [];

  void adicionarUsuario(Cadastro usuario) {
    usuarios.add(usuario);
  }

  bool logarUsuario(Login loginUsuario){
    for(int i=0; i<usuarios.length; i++){
      if(usuarios[i].email == loginUsuario.email && usuarios[i].senha == loginUsuario.senha){
        return true;
      }
    }
    return false;
  }

}
