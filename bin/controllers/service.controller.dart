import 'dart:convert';

import 'package:myserver/constants.dart';
import 'package:myserver/models/appsflyer_result.dart';
import 'package:myserver/models/balance.dart';
import 'package:myserver/models/conversion_model.dart';
import 'package:myserver/models/keitaro_config.dart';
import 'package:myserver/models/link_data.dart';
import 'package:myserver/models/new_track.dart';
import 'package:myserver/models/payloadmodel.dart';
import 'package:myserver/models/total_balance.dart';
import 'package:myserver/server.dart';
import 'package:myserver/services/FBClient.dart';
import 'package:myserver/services/keitaro_service.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';

import '../api/database.dart';
import '../api/zero_crypto_pay_api.dart';

class ServiceController {
  Future<Response> getKeitaroCampaign(Request request) async {
    final userId = request.params['user'];
    var res = await API.getKeitaroCampaign(userId: userId ?? "");
    return Response.ok(
      jsonEncode(res),
      headers: {'Content-type': 'application/json'},
    );
  }

  Future<Response> setUserKeitaroIdHandler(Request request) async {
    final userId = request.params['user'];
    final Map<String, dynamic> body = jsonDecode(await request.readAsString());

    // var res = await FirebaseService()
    //     .setKeitaroId(email: userId ?? "", keitaroId: body);
    return Response.ok('');
  }

  Future<Response> createFlow(Request request) async {
    final campaignId = request.params['campaignId'];
    final Map<String, dynamic> body = jsonDecode(await request.readAsString());

    var res = await DioClient().createFlow(
        campaignId: campaignId ?? '', streamName: body["streamName"]);
    return Response.ok(
      jsonEncode(res),
      headers: {'Content-type': 'application/json'},
    );
  }

  Future<Response> updateFlow(Request request) async {
    final streamId = request.params['keitaroStreamId'];
    final Map<String, dynamic> body = jsonDecode(await request.readAsString());

    var res = await DioClient().updateFlow(jsonFlow: body, streamId: streamId!);
    return Response.ok(
      jsonEncode(res),
      headers: {'Content-type': 'application/json'},
    );
  }

  Future<Response> getUserBalance(Request request) async {
    final userId = request.params['userId'];

    TotalBalance res = await API.getBalance(userId: userId ?? "");
    return Response.ok(
      jsonEncode(res.toJson()),
      headers: {'Content-type': 'application/json'},
    );
  }

  Future<Response> getConversionLink(Request request) async {
    final data = request.params['data'];
    LinkData dataDecoded =
        LinkData.fromJson(jsonDecode(utf8.decode(base64Decode(data!))));

    final Payload? payload = data.isNotEmpty
        ? Payload.fromJson(jsonDecode(utf8.decode(base64Decode(data))))
        : null;
    KeitaroConfig? keitaroConfig =
        await getKeitaroConfig(package: payload?.package ?? "null");

    AppsflyerModel? appsflyerModel = await fetchAppsflyer(
        appsflyerUrl:
            "https://gcdsdk.appsflyersdk.com/install_data/v4.0/${payload?.package}?device_id=${payload?.appsflyerUID}&devkey=${payload?.appsflyerDevKey}");

    print("APPSFLYERMODEL $appsflyerModel");
    print("appsflyerModel $appsflyerModel");
    ConversionModel conversionModel = ConversionModel(
      advertisingId: payload?.advertisingId ?? "",
      package: payload?.package ?? "",
      devToken: payload?.appsflyerDevKey ?? "",
      af_status: appsflyerModel?.af_status ?? "",
      auid: payload?.appsflyerUID ?? "",
      install_time: appsflyerModel?.install_time ?? "",
      af_message: appsflyerModel?.af_message ?? "",
      adset_id: appsflyerModel?.adset_id ?? "",
      campaign_id: appsflyerModel?.campaign_id ?? "",
      campaign: appsflyerModel?.campaign ?? "",
      network: appsflyerModel?.network ?? "",
      adid: appsflyerModel?.adid ?? "",
    );

    Uri? parsedParams = parseParams(
        fbDeepLink: payload?.fbDeepLink ?? "", appsflyer: appsflyerModel!);

    TotalBalance balance = await API.getBalance(
        userId: parsedParams?.queryParameters["partnerName"] ?? "");
    if (!(balance.totalBalance?.isNegative ?? true)) {
      print("BALANCE NOT NEGATIVE");
      var updateBalance = await API.updateBalance(BalanceModel(
          userid: parsedParams?.queryParameters["partnerName"] ?? "",
          amount: -0.10,
          advertisingId: payload?.advertisingId ?? "unknown",
          package: payload?.package ?? "",
          status: 1,
          id: 0));
      print("BALANCE $balance");

      var res = await API.addConversion(conversionModel);
      var parsedFBdeeplink =
          parseDeepLink(fbDeepLink: payload?.fbDeepLink ?? "");

      var link = generateLink(
          clientId: payload?.clientId ?? "unknown",
          advertisingId: payload?.advertisingId ?? "unknown",
          installReferrer: payload?.installReferrer ?? "unknown",
          pushData: payload?.pushData ?? "unknown",
          rawLink:
              "https://config.fastern.site/{partner_name}?sub_id_1={app_sub_1}&sub_id_2={app_sub_2}&sub_id_3={app_sub_3}&sub_id_4={app_sub_4}&sub_id_5={app_sub_5}&adid={app_adid}&advertising_id={app_advertising_id}&partner_stream={app_partner_stream}&package_name={app_package_name}",
          appsflyerData: appsflyerModel,
          package: payload?.package ?? "",
          parsedParams: parsedParams);
      return Response.found(link);
    } else {
      var link = generateLink(
          clientId: payload?.clientId ?? "unknown",
          advertisingId: payload?.advertisingId ?? "unknown",
          installReferrer: payload?.installReferrer ?? "unknown",
          pushData: payload?.pushData ?? "unknown",
          rawLink:
              "https://config.fastern.site/rocket_traffic?sub_id_1={app_sub_1}&sub_id_2={app_sub_2}&sub_id_3={app_sub_3}&sub_id_4={app_sub_4}&sub_id_5={app_sub_5}&adid={app_adid}&advertising_id={app_advertising_id}&partner_stream={app_partner_stream}&package_name={app_package_name}",
          appsflyerData: appsflyerModel,
          package: payload?.package ?? "",
          parsedParams: parsedParams);

      return Response.found(link);
    }
  }

  Future<Response> successPayment(Request request) async {
    var query = request.url.queryParameters;
    if (query["id_order"] != null && query["track_id"] != null) {
      final confirmTransaction =
          await API.confirmTransaction(id: int.parse(query["id_order"] ?? ""));
      return Response.found("https://orbitapps-4214e.web.app/#/");
    }
    return Response.unauthorized(
      jsonEncode({"error": "not found"}),
      headers: {'Content-type': 'application/json'},
    );
  }

  Future<Response> newPayment(Request request) async {
    final Map<String, dynamic> body = jsonDecode(await request.readAsString());
    double amount = body["amount"];
    String userId = body["userId"];
    var newBalance = BalanceModel(
        userid: userId,
        amount: amount,
        advertisingId: "DEPOSIT",
        package: "DEPOSIT",
        status: 0,
        id: 0);
    var newTransaction = await API.newDeposit(newBalance);
    NewTrack? res = await ZCPAPI.newTrack(
        amount: amount,
        token: Constants.zrcpayToken,
        orderId: newTransaction.id);
    return Response.ok(
      jsonEncode(res?.toJson()),
      headers: {'Content-type': 'application/json'},
    );
  }

  Future<Response> addFb(Request request) async {
    final Map<String, dynamic> body = jsonDecode(await request.readAsString());
    List<String> accs = body["accs"].cast<String>();
    String appId = body["appId"];
    String userId = body["userId"];
    String package = body["package"];

    var res = await FBClient().addFbAccs(appId: appId, accs: accs);
    if(res["message"] == "Accounts was added successfully") {
      var resDB = await API.updateAccs(accs: accs, userId: userId, appPackage: package);
    }
    return Response.ok(
      jsonEncode({"res": accs, "appId": appId, "userId": userId, "res" : res}),
      headers: {'Content-type': 'application/json'},
    );
  }

  Future<Response> removeFb(Request request) async {
    final Map<String, dynamic> body = jsonDecode(await request.readAsString());
    List<String> accs = body["accs"].cast<String>();
    String appId = body["appId"];
    String userId = body["userId"];

    var res = await FBClient().removeFbAccs(appId: appId, accs: accs);
    // if(res["message"] == "Accounts was added successfully") {
    //
    // }

    return Response.ok(
      jsonEncode({"res": accs, "appId": appId, "userId": userId, "res" : res.toString()}),
      headers: {'Content-type': 'application/json'},
    );
  }
}
