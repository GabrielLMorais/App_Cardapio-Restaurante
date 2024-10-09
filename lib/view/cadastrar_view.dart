import 'package:app_cardapio_restaurante/model/cadastro.dart';
import 'package:app_cardapio_restaurante/service/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final UsuarioService srv = GetIt.instance<UsuarioService>();

class CadastrarView extends StatefulWidget {
  const CadastrarView({super.key});

  @override
  State<CadastrarView> createState() => _CadastrarViewState();
}

class _CadastrarViewState extends State<CadastrarView> {
  var _formKey = GlobalKey<FormState>();
  var ctrlNome = TextEditingController();
  var ctrlEmail = TextEditingController();
  var ctrlSenha = TextEditingController();
  var ctrlCSenha = TextEditingController();

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
                'assets/imagens/loguinho3.png', // Caminho da sua imagem
                height: 350, // Altura da imagem
                width: 800,  // Largura da imagem
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Criar conta',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: ctrlNome,
                decoration: InputDecoration(
                  labelText: 'Nome:',
                  border: OutlineInputBorder(),
                  hintText: 'Informe seu nome completo',
                  hintStyle: TextStyle(color: Colors.grey),
                  icon: Icon(Icons.person, color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              TextField(
                controller: ctrlEmail,
                decoration: InputDecoration(
                  labelText: 'Email:',
                  border: OutlineInputBorder(),
                  hintText: 'Informe seu e-mail',
                  hintStyle: TextStyle(color: Colors.grey),
                  icon: Icon(Icons.email, color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              TextField(
                controller: ctrlSenha,
                decoration: InputDecoration(
                  labelText: 'Senha:',
                  border: OutlineInputBorder(),
                  hintText: 'Informe sua senha',
                  hintStyle: TextStyle(color: Colors.grey),
                  icon: Icon(Icons.password, color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              TextField(
                controller: ctrlCSenha,
                decoration: InputDecoration(
                  labelText: 'Confirme sua senha:',
                  border: OutlineInputBorder(),
                  hintText: 'Confirme sua senha',
                  hintStyle: TextStyle(color: Colors.grey),
                  icon: Icon(Icons.password_rounded, color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              Builder(
                builder: (BuildContext context) {
                  return ElevatedButton(
                    onPressed: () {
                      srv.adicionarUsuario(
                        Cadastro(
                          ctrlNome.text,
                          ctrlEmail.text,
                          ctrlSenha.text,
                          ctrlCSenha.text,
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Cadastrado com sucesso.')),
                      );

                      // Navegar para a tela de login
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.pushReplacementNamed(context, 'login');
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      foregroundColor: Colors.white,
                      minimumSize: Size(800, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                    ),
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  minimumSize: Size(800, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                ),
                child: Text(
                  'Voltar',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
