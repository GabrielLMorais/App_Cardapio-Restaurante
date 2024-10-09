import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:app_cardapio_restaurante/service/cardapio_service.dart';
import 'package:app_cardapio_restaurante/service/pedido_service.dart';

final CardapioService srv = GetIt.instance<CardapioService>();
final PedidoService pedidoSrv = PedidoService();

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
    _pedidos = srv.retornarPedidosSalvos();
  }

  String _calcularPrecoTotal() {
    double total = 0;
    for (var pratoId in _pedidos) {
      var prato = srv.pratos[pratoId];
      int quantidade = pedidoSrv.pedidos.firstWhere((item) => item.nome == prato.nome).quantidade;
      total += (double.tryParse(prato.preco.replaceAll('R\$', '').replaceAll(',', '.')) ?? 0) * quantidade;
    }
    return 'R\$ ${total.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  void _atualizarQuantidade(String nomePrato, int quantidade) {
    setState(() {
      var pedido = pedidoSrv.pedidos.firstWhere((item) => item.nome == nomePrato);
      pedido.quantidade += quantidade;
      if (pedido.quantidade < 1) {
        pedido.quantidade = 1; // Impede que a quantidade seja menor que 1
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level Up Restaurantes', style: TextStyle(color: Colors.white)),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Meus Pedidos',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _pedidos.length,
                itemBuilder: (context, index) {
                  int pratoId = _pedidos[index];
                  var prato = srv.pratos[pratoId];
                  var pedido = pedidoSrv.pedidos.firstWhere((item) => item.nome == prato.nome);

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
                            height: 110,
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
                            title: Text(
                              prato.nome,
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Preço: ${prato.preco}', // Preço fixo do prato
                                  style: TextStyle(fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        _atualizarQuantidade(prato.nome, -1);
                                      },
                                    ),
                                    Text(
                                      '${pedido.quantidade}',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        _atualizarQuantidade(prato.nome, 1);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  _pedidos.removeAt(index);
                                  srv.removerPedido(pratoId);
                                  pedidoSrv.pedidos.removeWhere((item) => item.nome == prato.nome);
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
              padding: EdgeInsets.fromLTRB(20, 20, 20, 42),
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _pedidos.clear();
                pedidoSrv.pedidos.clear();
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Compra concluída com sucesso!')),
              );
            },
            child: Icon(Icons.check),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, 'cardapio');
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
