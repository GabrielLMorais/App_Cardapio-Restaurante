import '../model/cardapio.dart';

class CardapioService {
  List<Cardapio> pratos = [];

  void inserirPrato(Cardapio prato) {
    pratos.add(prato);
  }

  Cardapio retornarPratos(id){
    return pratos[id];
  }

  // Lista para armazenar os pedidos
  List<int> _pedidosSalvos = [];

  // Adiciona um prato ao pedido
  void adicionarPedido(int idPrato) {
    _pedidosSalvos.add(idPrato);
  }

  // Remove um prato do pedido
  void removerPedido(int idPrato) {
    _pedidosSalvos.remove(idPrato);
  }

  // Retorna a lista de pedidos salvos
  List<int> retornarPedidosSalvos() {
    return _pedidosSalvos;
  }
}