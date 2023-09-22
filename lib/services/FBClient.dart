import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:myserver/constants.dart';
import 'package:myserver/models/new_track.dart';

class FBClient {
  final Dio _dio = Dio(BaseOptions(
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
    // connectTimeout: Duration(seconds: 200),
    // receiveTimeout: Duration(seconds: 200),
  ));

  final _baseUrl = 'http://64.176.66.64:8002/api';
  final apiKey = '24314801-8229-45f6-886b-10d088c31344';

  Future<dynamic> addFbAccs(
      {required String appId, required List<String> accs}) async {
    Response addAccData = await _dio.post(
      'http://64.176.66.64:8002/api/add/$appId?key=$apiKey',
      data: jsonEncode({
        "accs":accs
      }),
    );

    print('NewTrack Info: ${addAccData.data}');

    // NewTrack newTrack = NewTrack.fromJson(jsonDecode(newTrackData.data));

    return addAccData;
  }

  Future<dynamic> removeFbAccs(
      {required String appId, required List<String> accs}) async {
    Response addAccData = await _dio.post(
      'http://64.176.66.64:8002/api/remove/$appId?key=$apiKey',
      data: jsonEncode({
        "accs":accs
      }),
    );

    print('NewTrack Info: ${addAccData.data}');

    // NewTrack newTrack = NewTrack.fromJson(jsonDecode(newTrackData.data));

    return addAccData;
  }
}
