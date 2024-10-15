import '../model/cardapio.dart';

class CardapioService {
  List<Cardapio> pratos = [];

  void inserirPrato(Cardapio prato) {
    pratos.add(prato);
  }

  Cardapio retornarPratos(id){
    return pratos[id];
  }

  List<int> _pedidosSalvos = [];

  void adicionarPedido(int idPrato) {
    _pedidosSalvos.add(idPrato);
  }

  void removerPedido(int idPrato) {
    _pedidosSalvos.remove(idPrato);
  }

  List<int> retornarPedidosSalvos() {
    return _pedidosSalvos;
  }
}