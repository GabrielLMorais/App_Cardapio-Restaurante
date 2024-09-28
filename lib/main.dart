import 'package:app_cardapio_restaurante/model/cardapio.dart';
import 'package:app_cardapio_restaurante/service/cardapio_service.dart';
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

  var srv = getIt<CardapioService>();
  srv.inserirPrato(
    Cardapio('Haburguer de Carne', 'Tem Carne', 'R\$25,00', 'assets/imagens/hamburguer.png'),
  );
  srv.inserirPrato(
    Cardapio('Pizza de frango', 'Tem Frango', 'R\$45,00', 'assets/imagens/pizzaf.png'),
  );
  srv.inserirPrato(
    Cardapio('Coca-Cola', '', 'R\$6,00', ''),
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
