import 'dart:convert';
import 'dart:io';
import 'package:args/args.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf/shelf_io.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';

import 'api/database.dart';
import 'routes/init.route.dart';

final overrideHeaders = {
  ACCESS_CONTROL_ALLOW_ORIGIN: 'https://orbitapps-4214e.web.app',
  ACCESS_CONTROL_ALLOW_HEADERS:
      "Access-Control-Allow-Headers, Origin,Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers, Api-Key"
};

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;
  // FirebaseService().init();

  await API.init();
  // withHotreload(() => createServer(args));

  await createServer(args);
}

Future<void> createServer(List<String> args) async {
  handler(shelf.Request request) {
    print(request.url);
    return InitRoute().handler(request);
  }

  var parse = ArgParser()..addOption('port', abbr: "p");
  var result = parse.parse(args);
  var portStr = result["port"] ?? Platform.environment["PORT"] ?? "8080";
  var port = int.tryParse(portStr);
  if (port == null) {
    stdout.writeln('Could not parse value "$portStr" into a number');
    exitCode = 64;
  }

  var updateHandler = const shelf.Pipeline()
      .addMiddleware(shelf.logRequests())
      .addMiddleware(corsHeaders(headers: overrideHeaders))
      .addHandler(handler);

  final ip = InternetAddress.anyIPv4;

  // return io.serve(updateHandler, 'localhost', 8080);
  final server = await serve(updateHandler, ip, 8080);
  print('Server listening on port ${server.port}');

  zeroCryptoPayNewTrack() {}
}
