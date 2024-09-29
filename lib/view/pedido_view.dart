import 'package:app_cardapio_restaurante/service/cardapio_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final CardapioService srv = GetIt.instance<CardapioService>();

class PedidoView extends StatefulWidget {
  const PedidoView({super.key});

  @override
  State<PedidoView> createState() => _PedidoViewState();
}

class _PedidoViewState extends State<PedidoView> {
  List<int> _pedidos = [];

  @override
  void initState() {
    super.initState();
    // Recuperar pedidos salvos ao iniciar a tela
    _pedidos = srv.retornarPedidosSalvos();
  }

  String _calcularPrecoTotal() {
    double total = 0;
    for (var pratoId in _pedidos) {
      var prato = srv.pratos[pratoId];
      total += double.tryParse(prato.preco.replaceAll('R\$', '').replaceAll(',', '.')) ?? 0;
    }
    return 'R\$ ${total.toStringAsFixed(2).replaceAll('.', ',')}';
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
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinha o texto à esquerda
          children: [
            Text(
              'Meus Pedidos',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20), // Espaço entre o título e a lista de pedidos
            Expanded( // Expandir a lista para ocupar o espaço restante
              child: ListView.builder(
                itemCount: _pedidos.length,
                itemBuilder: (context, index) {
                  int pratoId = _pedidos[index];
                  var prato = srv.pratos[pratoId];
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
                              prato.imagem,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(prato.nome, style: TextStyle(fontSize: 20)),
                            subtitle: Text(
                              srv.pratos[index].preco,
                              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  _pedidos.removeAt(index);
                                  srv.removerPedido(pratoId);
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
            padding: EdgeInsets.fromLTRB(20,20,20,42),
            child: Text(
              'Total: ${_calcularPrecoTotal()}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'cardapio');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
