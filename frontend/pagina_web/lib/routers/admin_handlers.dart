

import 'package:fluro/fluro.dart';
import 'package:pagina_web/ui/views/home_view.dart';

class AdminHandler {
  static Handler principal = Handler(handlerFunc: (context, params) {
    
    return const HomeView();

  });
}