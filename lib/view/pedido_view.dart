import 'package:app_cardapio_restaurante/service/cardapio_service.dart';
import 'package:app_cardapio_restaurante/service/pedido_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final CardapioService srv = GetIt.instance<CardapioService>();

class PedidoView extends StatefulWidget {
  const PedidoView({super.key});

  @override
  State<PedidoView> createState() => _PedidoViewState();
}

class _PedidoViewState extends State<PedidoView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level Up Restaurantes', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
        actions: [
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
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: srv.pratos.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.only(bottom: 10), // Espaçamento entre os cartões
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14), // Raio superior esquerdo
                      bottomLeft: Radius.circular(14), // Raio inferior esquerdo
                    ),
                  
                    child: Container(
                      height: 70,
                      width: 70,
                      margin: EdgeInsets.fromLTRB(1, 0, 0, 0), // Remove margens do Container
                      child: Image.asset(
                        srv.pratos[index].imagem,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(srv.pratos[index].nome, style: TextStyle(fontSize: 22)),
                      subtitle: Text(
                        srv.pratos[index].preco,
                        style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, 'detalhes', arguments: index);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}