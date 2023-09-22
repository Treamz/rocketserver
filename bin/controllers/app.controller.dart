import 'dart:convert';
import 'dart:io';

import 'package:myserver/models/appsflyer_result.dart';
import 'package:myserver/models/balance.dart';
import 'package:myserver/models/conversion_model.dart';
import 'package:myserver/models/keitaro_config.dart';
import 'package:myserver/models/payloadmodel.dart';
import 'package:myserver/server.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_secure_cookie/shelf_secure_cookie.dart';
import 'package:shelf_session/session_middleware.dart';

import '../api/database.dart';

class AppController {
  Future<Response> getConfig(Request request) async {
    final message = request.params['config'];
    final package = request.headers["X-Requested-With"];
    final xrealip = request.headers["X-Real-IP"];
    var config = await getConfigKeitaro(
        base64data: message ?? "",
        package: package ?? "null",
        ip: xrealip ?? "");
    return Response.ok('$config\n');
  }

}
