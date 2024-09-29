import 'package:app_cardapio_restaurante/service/cardapio_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final CardapioService srv = GetIt.instance<CardapioService>();

class DetalhesView extends StatefulWidget {
  const DetalhesView({super.key});

  @override
  State<DetalhesView> createState() => _DetalhesViewState();
}

class _DetalhesViewState extends State<DetalhesView> {
  @override
  Widget build(BuildContext context) {

    final int idPrato = ModalRoute.of(context)!.settings.arguments as int;

    var pratos = srv.retornarPratos(idPrato);

    return Scaffold( 
      appBar: AppBar(
        title: Text('Level Up Restaurantes', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 30),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'cardapio');
            },
            icon: Icon(Icons.arrow_back_sharp, color: Colors.white),
          ), 
          IconButton(
            padding: EdgeInsets.only(right: 30),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'login');
            },
            icon: Icon(Icons.logout_sharp, color: Colors.white),
          ),          
        ],
      ),
      backgroundColor: Color.fromRGBO(66, 0, 79, 1),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Detalhes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Image.asset(
                  srv.pratos[idPrato].imagem,
                  height: 300,
                  width: 800,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                Text(pratos.nome,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(pratos.descricacao,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 65,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(pratos.preco,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          srv.adicionarPedido(idPrato);
      Navigator.pushNamed(context, 'pedido');
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
