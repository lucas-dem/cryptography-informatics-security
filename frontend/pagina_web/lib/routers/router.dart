

import 'package:fluro/fluro.dart';
import 'package:pagina_web/routers/admin_handlers.dart';

class Flurorouter {

  static FluroRouter router = FluroRouter();

  static String homeroute = '/';

  static void configuredRoutes() {
    router.define(homeroute,
        handler: AdminHandler.principal, transitionType: TransitionType.fadeIn);

  }
}