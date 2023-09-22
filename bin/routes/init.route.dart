import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'app.routes.dart';
import 'service.routes.dart';

class InitRoute {
  Handler get handler {
    var router = Router();
    router.mount('/', AppRoutes().handler);
    router.mount('/service', ServiceRoutes().handler);
    return router;
  }
}
