import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../controllers/app.controller.dart';

class AppRoutes {
  Handler get handler {
    final AppController appController = AppController();
    var router = Router();
    router.get('/<config>', appController.getConfig);
    // router.get('/', appController.getConversionLink);
    return router;
  }
}
