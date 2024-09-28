// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app_cardapio_restaurante/service/cadastrar_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

//
// UTILIZAR o serviço ContatoService
//
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
        body: Padding(
          padding: EdgeInsets.fromLTRB(40, 450, 40, 0),
          child : Form(
            key: _formKey,
            child: Column(
              children:[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Nome:',
                    border: OutlineInputBorder(),
                    hintText: 'Informe seu nome completo',
                    icon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email:',
                    border: OutlineInputBorder(),
                    hintText: 'Informe seu e-mail',
                    icon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Senha:',
                    border: OutlineInputBorder(),
                    hintText: 'Informe sua senha',
                    icon: Icon(Icons.password),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Confirme sua senha:',
                    border: OutlineInputBorder(),
                    hintText: 'Confirme sua senha',
                    icon: Icon(Icons.password),
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
