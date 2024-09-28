import 'package:app_cardapio_restaurante/service/cadastrar_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final CadastrarService srv = GetIt.instance<CadastrarService>();

class CadastrarView extends StatefulWidget {
  const CadastrarView({super.key});

  @override
  State<CadastrarView> createState() => _CadastrarViewState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _CadastrarViewState extends State<CadastrarView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(66, 0, 79, 1),
        body: Padding(
          padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
          child : Form(
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
                  child: Text('Criar conta',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nome:',
                    border: OutlineInputBorder(),
                    hintText: 'Informe seu nome completo',
                    hintStyle: TextStyle(
                      color: Colors.grey, // Altere a cor do hintText aqui
                    ),
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
                  decoration: InputDecoration(
                    labelText: 'Email:',
                    border: OutlineInputBorder(),
                    hintText: 'Informe seu e-mail',
                    hintStyle: TextStyle(
                      color: Colors.grey, // Altere a cor do hintText aqui
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
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Senha:',
                    border: OutlineInputBorder(),
                    hintText: 'Informe sua senha',
                    hintStyle: TextStyle(
                      color: Colors.grey, // Altere a cor do hintText aqui
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
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Confirme sua senha:',
                    border: OutlineInputBorder(),
                    hintText: 'Confirme sua senha',
                    hintStyle: TextStyle(
                      color: Colors.grey, // Altere a cor do hintText aqui
                    ),
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
                ElevatedButton(
		              onPressed: () {
                    Navigator.pushReplacementNamed(context, 'cardapio');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    minimumSize: Size(800, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)), // Remove o border radius
                    ),
                  ),
		              child: Text(
                    'Cadastrar',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
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
                      borderRadius: BorderRadius.all(Radius.circular(6)), // Remove o border radius
                    ),
                  ),
		              child: Text(
                    'Voltar',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
