import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/appsflyer_result.dart';
import 'models/config_model.dart';
import 'models/keitaro_config.dart';
import 'dart:convert' show utf8, base64;

Future<AppsflyerModel?>? fetchAppsflyer({required String appsflyerUrl}) async {
  try {
    var response = await http.get(Uri.parse(appsflyerUrl));
    return AppsflyerModel.fromJson(jsonDecode(response.body));
  } catch (ex) {
    return null;
  }
}

Future<KeitaroConfig?> getKeitaroConfig({required package}) async {
  //"
  try {
    var response = await http.get(
        Uri.parse(
            "https://config.fastern.site/config?installer=com.cloud.appsflyer"),
        headers: {"X-Requested-With": package});
    print("RESP ${response.body}");
    return KeitaroConfig.fromJson(jsonDecode(response.body));
  } catch (ex) {
    return KeitaroConfig(webview: ex.toString());
  }
}

Uri? parseCampaign(String? campaign) {
  var uri = campaign != null ? Uri.parse("app://?${Uri.decodeQueryComponent(campaign)}") : null;
  return uri;
}

String generateLink(
    {required String clientId,
    required String advertisingId,
    required String installReferrer,
    required String pushData,
    required String rawLink,
    required AppsflyerModel appsflyerData,
    required Uri? parsedParams,
    required String package}) {
  String finalLink;
  print(rawLink);
  try {
    finalLink = rawLink
        .replaceAll("{partner_name}",
            parsedParams?.queryParameters["partnerName"] ?? "orbitapps_traffic")
        .replaceAll("{app_partner_stream}",
            parsedParams?.queryParameters["partnerStream"] ?? "null")
        .replaceAll("{app_package_name}", package)
        .replaceAll("{app_client_id}", clientId)
        .replaceAll("{app_placement}", "${appsflyerData.adset_id}")
        .replaceAll("{app_campaign_id}", "${appsflyerData.campaign_id}")
        .replaceAll("{app_media_source}", "${appsflyerData.network}")
        .replaceAll(
            "{app_sub_1}", parsedParams?.queryParameters["sub1"] ?? "null")
        .replaceAll(
            "{app_sub_2}", parsedParams?.queryParameters["sub2"] ?? "null")
        .replaceAll(
            "{app_sub_3}", parsedParams?.queryParameters["sub3"] ?? "null")
        .replaceAll(
            "{app_sub_4}", parsedParams?.queryParameters["sub4"] ?? "null")
        .replaceAll(
            "{app_sub_5}", parsedParams?.queryParameters["sub5"] ?? "null")
        .replaceAll("{app_stream_id}",
            parsedParams?.queryParameters["partnerName"] ?? "null")
        .replaceAll("{app_campaign_name}", parsedParams?.query ?? "")
        .replaceAll("{app_advertising_id}", advertisingId)
        .replaceAll("{app_adid}", "${appsflyerData.adid}")
        .replaceAll("{app_install_referrer}", installReferrer)
        .replaceAll("{app_push_data}", pushData);
    return finalLink;
  } catch (ex) {
    print("LINK ERRRO ${ex.toString()}");
    return "ERROR";
  }
}

Future<String> getConfigKeitaro(
    {required String base64data,
    required String package,
    required String ip}) async {
  try {
    Config config =
        Config.fromJson(jsonDecode(utf8.decode(base64Decode(base64data))));

    var response = await http.get(
        Uri.parse(
            "https://config.fastern.site/click_api/v3?token=yBsz3sLcWRTJ5Qx9&log=1&info=1&ip=$ip&installer=${config.installer}"),
        headers: {"X-Requested-With": package});

    print(jsonEncode(jsonDecode(response.body)["body"]));

    final encoded =
        base64.encode(utf8.encode(jsonDecode(response.body)["body"]));

    return encoded;
  } catch (ex) {
    return base64
        .encode(utf8.encode(jsonEncode({"error": true, "msg": ex.toString()})));
  }
}

Uri? parseDeepLink({required String fbDeepLink}) {
  final facebookDeepLink = RegExp(
      r'([a-zA-Z]{2,20}):\/\/([\w_-]+(?:(?:\.[\w_-]+)?))([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?');

  print(facebookDeepLink.hasMatch("myapp://$fbDeepLink"));
  if (facebookDeepLink.hasMatch('myapp://$fbDeepLink')) {
    Uri deepLink = Uri.parse('myapp://?$fbDeepLink');
    return deepLink;
  }
  return null;
}

Uri? parseParams(
    {required String fbDeepLink, required AppsflyerModel appsflyer}) {
  Uri? fbDeepLinkUri = parseDeepLink(fbDeepLink: fbDeepLink);
  Uri? appsflyerUri = parseCampaign(appsflyer.campaign);
  if (fbDeepLinkUri != null) {
    return fbDeepLinkUri;
  }
  if (appsflyerUri != null) {
    return appsflyerUri;
  }

  return null;
}
