import 'package:app_cardapio_restaurante/model/cardapio.dart';
import 'package:app_cardapio_restaurante/service/cardapio_service.dart';
import 'package:app_cardapio_restaurante/service/usuario_service.dart';
import 'package:app_cardapio_restaurante/view/cadastrar_view.dart';
import 'package:app_cardapio_restaurante/view/cardapio_view.dart';
import 'package:app_cardapio_restaurante/view/detalhes_view.dart';
import 'package:app_cardapio_restaurante/view/login_view.dart';
import 'package:app_cardapio_restaurante/view/pedido_view.dart';
import 'package:app_cardapio_restaurante/view/senha_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<CardapioService>(CardapioService());
  GetIt.instance.registerSingleton<UsuarioService>(UsuarioService());

  var srv = getIt<CardapioService>();
  srv.inserirPrato(
    Cardapio('Lanche de carne', 'Um hambúrguer com carne bovina grelhada, com fatias de tomate, cebola, e alface, com cheddar. Tudo isso é servido em um pão macio e levemente tostado.', 'R\$27,99',
        'assets/imagens/hamburguer.png'),
  );
  srv.inserirPrato(
    Cardapio('Lanche de frango', 'Um hambúrguer de frango grelhado, com fatias de tomate, cheddar, e alface. Tudo isso é servido em um pão macio e levemente tostado.', 'R\$25,99', 
        'assets/imagens/lanche-frango.png'),
  );
  srv.inserirPrato(
    Cardapio('Lanche de cheddar', 'Um hambúrguer com carne bovina grelhada, coberta por uma porção de queijo cheddar derretido e fatias de bacon. Tudo isso é servido em um pão macio e levemente tostado.', 'R\$24,99', 
        'assets/imagens/lanche-cheddar-bacon.png'),
  );
  srv.inserirPrato(
    Cardapio('Lanche de cebola', 'Um hambúrguer com carne bovina grelhada, com fatias de tomate, cebola empanada (Onion Rings), e alface, com cheddar. Tudo isso é servido em um pão macio e levemente tostado.', 'R\$29,99', 
        'assets/imagens/lanche-cebola.png'),
  );
  srv.inserirPrato(
    Cardapio('Pizza de frango', 'Uma pizza de frango temperado e desfiado, cobertas por uma camada de queijo derretido. Pedaços de tomate e azeitonas, tudo sobre uma massa leve e crocante.', 'R\$45,99',
        'assets/imagens/pizzaf.png'),
  );
  srv.inserirPrato(
    Cardapio('Pizza de calabresa', 'Uma pizza de calabresa, cobertas por uma camada de queijo derretido. Pedaços de tomate e ervas, tudo sobre uma massa leve e crocante.', 'R\$43,99',
        'assets/imagens/pizza-calabresa.png'),
  );
  srv.inserirPrato(
    Cardapio('Pizza de queijo', 'Uma pizza de queijo, coberta por uma camada de queijo derretido. Pedaços de tomate e ervas, tudo sobre uma massa leve e crocante.', 'R\$41,99',
        'assets/imagens/pizza-queijo.png'),
  );
  srv.inserirPrato(
    Cardapio('Pizza acebolada', 'Uma pizza de calabresa, cobertas por uma camada de queijo derretido. Pedaços de cebola, tomate e azeitonas, tudo sobre uma massa leve e crocante.', 'R\$44,99',
        'assets/imagens/pizza-calabresa-cebola.png'),
  );
  srv.inserirPrato(
    Cardapio('Batata frita', 'Batatas sequinhas, fritas na perfeição para garantir uma casquinha crocante por fora e maciez por dentro. Acompanhadas com maionese ou o molho de sua preferência.', 'R\$19,99',
        'assets/imagens/batata-frita.png'),
  );
  srv.inserirPrato(
    Cardapio('Balde de frango', 'Frango suculento por dentro e empanado com uma camada dourada e crocante por fora, preparado com temperos especiais para realçar o sabor. O balde vem repleto de pedaços.', 'R\$36,99', 
        'assets/imagens/balde-frango.png'),
  );
  srv.inserirPrato(
    Cardapio('Batata e cheddar', 'Batatas sequinhas, fritas na perfeição para garantir uma casquinha crocante por fora e maciez por dentro. Acompanhadas com queijo cheddar derretido e fatias de bacon.', 'R\$29,99', 
        'assets/imagens/batata-frita-cheddar.png'),
  );
  srv.inserirPrato(
    Cardapio('Salada', 'Uma combinação leve e nutritiva uma salada de alface crocante, tomates maduros e suculentos, fatias finas de cebola e pimentão fresco.', 'R\$12,99', 
        'assets/imagens/salada.png'),
  );
  srv.inserirPrato(
    Cardapio('Água', 'Uma garrafinha de água pura e cristalina, perfeita para matar a sede. Para um toque extra de frescor, adicione gelo e uma fatia de limão ao copo, criando uma bebida leve e revigorante.', 'R\$3,99', 
        'assets/imagens/agua.png'),
  );
  srv.inserirPrato(
    Cardapio('Coca-Cola', 'A clássica e irresistível bebida gaseificada, perfeita para qualquer momento!  Ela fica ainda mais refrescante ao ser acompanhada de gelo e uma fatia de limão no copo.', 'R\$6,99', 
        'assets/imagens/coca-cola.png'),
  );
  srv.inserirPrato(
    Cardapio('Suco de laranja', 'Refresque-se com um suco de laranja, feito com frutas selecionadas e repleto de sabor. Para um toque ainda mais gelado e revigorante, sirva com gelo e uma rodela de laranja no copo.', 'R\$4,99', 
        'assets/imagens/suco-laranja.png'),
  );
  srv.inserirPrato(
    Cardapio('Suco de limão', 'Refresque-se com um suco de limão, feito com frutas selecionadas e repleto de sabor. Para um toque ainda mais gelado e revigorante, sirva com gelo e uma rodela de limão no copo.', 'R\$4,99', 
        'assets/imagens/suco-limao.png'),
  );
  srv.inserirPrato(
    Cardapio('Bolo de chocolate', 'Este bolo macio e fofinho é preparado com ingredientes de alta qualidade, proporcionando um sabor intenso e rico. Coberto com uma camada de chocolate cremoso. Finalizado com um pouco de chantilly.', 'R\$39,99', 
        'assets/imagens/bolo.png'),
  );
  srv.inserirPrato(
    Cardapio('Sorvete', 'Uma deliciosa combinação de três sabores clássicos em um só lugar! Traz camadas de chocolate, baunilha e morango suave, oferecendo uma experiência refrescante e cheia de sabor a cada colherada.', 'R\$29,99', 
        'assets/imagens/sorvete.png'),
  );
  srv.inserirPrato(
    Cardapio('Pudim', ' Uma sobremesa leve, com textura cremosa que derrete na boca. Feito com a combinação perfeita de leite condensado e maracujá, traz um equilíbrio delicioso entre o doce e o azedinho da fruta.', 'R\$19,99', 
        'assets/imagens/pudim.png'),
  );
  srv.inserirPrato(
    Cardapio('Torta de morango', 'Uma sobremesa que combina uma massa leve e crocante com um recheio cremoso e suave. Coberta com morangos frescos e suculentos, essa delícia é finalizada com um pouco de chantilly.', 'R\$41,99', 
        'assets/imagens/torta-morango.png'),
  );

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginView(),
        'cadastrar': (context) => CadastrarView(),
        'senha': (context) => SenhaView(),
        'cardapio': (context) => CardapioView(),
        'detalhes': (context) => DetalhesView(),
        'pedido': (context) => PedidoView(),
      },
    );
  }
}
