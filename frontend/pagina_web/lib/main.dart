import 'package:flutter/material.dart';
import 'package:pagina_web/routers/router.dart';
import 'package:pagina_web/services/navigation_service.dart';
import 'package:pagina_web/ui/layouts/layout.dart';

void main() async {

  Flurorouter.configuredRoutes();
  runApp(const FakeApp());
}

class FakeApp extends StatelessWidget {
  const FakeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TecnoSolutions',
      initialRoute: Flurorouter.homeroute,
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: Flurorouter.router.generator,
      builder: ( _ , child ) {

        return Layout(
          child: child!
        );
        

      }
    );
  }
}
