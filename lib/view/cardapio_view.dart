import 'package:app_cardapio_restaurante/service/cardapio_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

//
// UTILIZAR o serviço CardapioService
//
final CardapioService srv = GetIt.instance<CardapioService>();

class CardapioView extends StatefulWidget {
  const CardapioView({super.key});

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level Up Restaurantes', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purple.shade900,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 30),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'inserir');
            },
            icon: Icon(Icons.logout_outlined, color: Colors.white),
          ),          
        ],
      ),
      backgroundColor: Colors.purple.shade50,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: srv.pratos.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(srv.pratos[index].nome, style: TextStyle(fontSize: 22)),
                subtitle: Text(
                  srv.pratos[index].preco,
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.pushNamed(context, 'detalhes', arguments: index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}