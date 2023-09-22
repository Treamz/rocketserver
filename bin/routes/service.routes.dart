import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../controllers/app.controller.dart';
import '../controllers/service.controller.dart';

class ServiceRoutes {

  //  ..post('/users/keitaroStream/<campaignId>', _setUserKeitaroStreamHandler)
  Handler get handler {
    final ServiceController serviceController = ServiceController();
    var router = Router();
    router.get('/users/keitaroId/<user>', serviceController.getKeitaroCampaign);
    router.post('/users/keitaroId/<user>', serviceController.setUserKeitaroIdHandler);
    router.post('/users/keitaroStream/<campaignId>', serviceController.createFlow);
    router.put('/users/keitaroStream/<keitaroStreamId>', serviceController.updateFlow);
    router.get('/users/getBalance/<userId>', serviceController.getUserBalance);
    router.get('/link/<data>', serviceController.getConversionLink);
    router.get('/payment/success', serviceController.successPayment);
    router.post('/payment/new', serviceController.newPayment);
    router.post('/fb/add', serviceController.addFb);
    router.post('/fb/remove', serviceController.removeFb);

    return router;
  }
}
