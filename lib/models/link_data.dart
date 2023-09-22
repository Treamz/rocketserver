class LinkData {
  String clientId;
  String advertisingId;
  String installReferrer;
  String pushData;
  String package;
  String appsflyerDevKey;
  String appsflyerUID;
  String fbDeepLink;

  LinkData(
      {required this.clientId,
      required this.advertisingId,
      required this.installReferrer,
      required this.pushData,
      required this.package,
      required this.appsflyerDevKey,
      required this.appsflyerUID,
      required this.fbDeepLink});

  factory LinkData.fromJson(Map<String, dynamic> json) {
    return LinkData(
        clientId: json["clientId"],
        advertisingId: json["advertisingId"],
        installReferrer: json["installReferrer"],
        pushData: json["pushData"],
        package: json["package"],
        appsflyerDevKey: json["appsflyerDevKey"],
        appsflyerUID: json["appsflyerUID"],
        fbDeepLink: json["fbDeepLink"]);
  }
}
