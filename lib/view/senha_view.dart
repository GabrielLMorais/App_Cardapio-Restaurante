import 'package:flutter/material.dart';

class SenhaView extends StatefulWidget {
  const SenhaView({super.key});

  @override
  State<SenhaView> createState() => _SenhaViewState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _SenhaViewState extends State<SenhaView> {
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
                  'assets/imagens/loguinho3.png',
                  height: 350, 
                  width: 800,  
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Esqueceu a senha',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                SizedBox(height: 150),
                ElevatedButton(
		              onPressed: () {
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
                    'Enviar',
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
