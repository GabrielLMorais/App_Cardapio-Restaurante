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
    // Obtém a largura e altura da tela
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(66, 0, 79, 1),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
        child: Form(
          key: _formKey,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/imagens/loguinho3.png', // Caminho da sua imagem
                      height: screenHeight * 0.3, // Altura proporcional
                      width: screenWidth * 0.8, // Largura proporcional
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Criar conta',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.08, // Tamanho de fonte proporcional
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: ctrlNome,
                      decoration: InputDecoration(
                        labelText: 'Nome:',
                        border: OutlineInputBorder(),
                        hintText: 'Informe seu nome',
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe seu nome';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
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
                    SizedBox(height: 16),
                    TextFormField(
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe sua senha';
                        }
                        if (value != ctrlSenha.text) {
                          return 'As senhas não coincidem';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Builder(
                      builder: (BuildContext context) {
                        return ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
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

                              Future.delayed(Duration(seconds: 1), () {
                                Navigator.pushReplacementNamed(context, 'login');
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            foregroundColor: Colors.white,
                            minimumSize: Size(screenWidth * 0.8, 50), // Largura proporcional
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                            ),
                          ),
                          child: Text(
                            'Cadastrar',
                            style: TextStyle(fontSize: screenWidth * 0.05), // Tamanho de fonte proporcional
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
                        minimumSize: Size(screenWidth * 0.8, 50), // Largura proporcional
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                      ),
                      child: Text(
                        'Voltar',
                        style: TextStyle(fontSize: screenWidth * 0.05), // Tamanho de fonte proporcional
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
