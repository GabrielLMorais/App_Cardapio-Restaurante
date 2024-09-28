import '../model/cardapio.dart';

class CardapioService {
  List<Cardapio> pratos = [];

  void inserirPrato(Cardapio prato) {
    pratos.add(prato);
  }

  Cardapio retornarPratos(id){
    return pratos[id];
  }
}