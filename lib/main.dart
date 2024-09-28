import 'package:app_cardapio_restaurante/model/cardapio.dart';
import 'package:app_cardapio_restaurante/service/cardapio_service.dart';
import 'package:app_cardapio_restaurante/view/cadastrar_view.dart';
import 'package:app_cardapio_restaurante/view/cardapio_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<CardapioService>(CardapioService());

  var srv = getIt<CardapioService>();
  srv.inserirPrato(
    Cardapio('Haburguer de Carne', '', 'RS25,00',),
  );
  srv.inserirPrato(
    Cardapio('Pizza de frango', '', 'RS45,00'),
  );
  srv.inserirPrato(
    Cardapio('Coca-Cola', '', 'RS6,00'),
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
      initialRoute: 'cadastrar',
      routes: {
        'cadastrar': (context) => CadastrarView(),
        'cardapio': (context) => CardapioView(),
      },
    );
  }
}
