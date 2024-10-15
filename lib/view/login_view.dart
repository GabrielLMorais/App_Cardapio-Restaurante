import 'package:app_cardapio_restaurante/model/login.dart';
import 'package:app_cardapio_restaurante/service/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final UsuarioService srv = GetIt.instance<UsuarioService>();

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var _formKey = GlobalKey<FormState>();
  var ctrlEmail = TextEditingController();
  var ctrlSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(66, 0, 79, 1),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                'assets/imagens/loguinho3.png',
                height: 350, 
                width: 800,
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: ctrlEmail,
                decoration: InputDecoration(
                  labelText: 'Email:',
                  border: OutlineInputBorder(),
                  hintText: 'Informe seu e-mail',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  icon: Icon(Icons.email, color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe um Email!';
                  }
                  if (value.length < 11) {
                    return 'Endereço de Email muito curto!';
                  }
                  if (!value.contains("@")) {
                    return 'Email não é valido';
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: ctrlSenha,
                decoration: InputDecoration(
                  labelText: 'Senha:',
                  border: OutlineInputBorder(),
                  hintText: 'Informe sua senha',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  icon: Icon(Icons.password, color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe sua senha';
                  }
                  if (value.length < 9) {
                    return 'Senha muito fraca, muito curta!';
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'senha');
                  },
                  child: Text(
                    'Esqueceu a senha',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 237, 133, 255),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    bool logado = srv.logarUsuario(Login(
                      ctrlEmail.text,
                      ctrlSenha.text,
                    ));

                    if (logado == false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Usuário não cadastrado!')),
                      );
                    } else {
                      Navigator.pushReplacementNamed(context, 'cardapio');
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  minimumSize: Size(800, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(6)),
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'cadastrar');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  minimumSize: Size(800, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(6)),
                  ),
                ),
                child: Text(
                  'Criar conta',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
