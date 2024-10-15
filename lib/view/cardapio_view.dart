import 'package:app_cardapio_restaurante/service/cardapio_service.dart';
import 'package:app_cardapio_restaurante/service/pedido_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final CardapioService srv = GetIt.instance<CardapioService>();
final PedidoService pedidoSrv = PedidoService();

class CardapioView extends StatefulWidget {
  const CardapioView({super.key});

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView> {
  List<int> _pedidos = [];
  final List<String> _titulos = [
    'Lanches',
    'Pizzas',
    'Especiais',
    'Bebidas',
    'Sobremesas',
  ];

  @override
  void initState() {
    super.initState();
    _pedidos = srv.retornarPedidosSalvos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Level Up Restaurantes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 30),
            onPressed: () {
              setState(() {
                _pedidos.clear();
                pedidoSrv.pedidos.clear();
              });
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
            if (index % 4 == 0) {
              int tituloIndex = index ~/ 4;
              String titulo = _titulos.length > tituloIndex
                  ? _titulos[tituloIndex]
                  : 'Outros Pratos';
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      titulo,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  _buildCard(index),
                ],
              );
            } else {
              return _buildCard(index);
            }
          },
        ),
      ),
    );
  }

  Widget _buildCard(int index) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14),
              bottomLeft: Radius.circular(14),
            ),
            child: Container(
              height: 70,
              width: 70,
              margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
              child: Image.asset(
                srv.pratos[index].imagem,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                srv.pratos[index].nome,
                style: TextStyle(fontSize: 22),
              ),
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
  }
}
