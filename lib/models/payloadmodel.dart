class Payload {
  String clientId;
  String advertisingId;
  String installReferrer;
  String pushData;
  String package;
  String appsflyerDevKey;
  String appsflyerUID;
  String? fbDeepLink;

  Payload(
      {required this.clientId,
      required this.advertisingId,
      required this.installReferrer,
      required this.pushData,
        required this.fbDeepLink,
      required this.package,
      required this.appsflyerDevKey,
      required this.appsflyerUID});

  factory Payload.fromJson(Map<String, dynamic> json) {
    return Payload(
        clientId: json["clientId"],
        advertisingId: json["advertisingId"],
        installReferrer: json["installReferrer"],
        pushData: json["pushData"],
        package: json["package"],
        appsflyerDevKey: json["appsflyerDevKey"],
        fbDeepLink: json["fbDeepLink"],
        appsflyerUID: json["appsflyerUID"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "clientId": clientId,
      "advertisingId": advertisingId,
      "installReferrer": installReferrer,
      "pushData": pushData,
      "package": package,
      "appsflyerDevKey": appsflyerDevKey,
      "appsflyerUID": appsflyerUID,
      "fbDeepLink": fbDeepLink
    };
  }
}
