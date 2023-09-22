class AppsflyerModel {
  String? af_status;
  String? install_time;
  String? af_message;
  String? adset_id;
  String? campaign_id;
  String? campaign;
  String? network;
  String? adid;

  AppsflyerModel(
      {required this.af_status,
      required this.campaign_id,
        required this.campaign,
      required this.network,
      required this.adset_id,
        required this.adid,
      required this.af_message,
      required this.install_time});

  factory AppsflyerModel.fromJson(Map<String, dynamic> json) {
    return AppsflyerModel(
        af_status: json["af_status"],
        af_message: json["af_message"],
        adid: json["adid"],
        install_time: json["install_time"],
        campaign_id: json["campaign_id"],
        campaign: json["campaign"],
        adset_id: json["adset_id"],
        network: json["network"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "af_status": af_status,
      "adid": adid,
      "af_message": af_message,
      "install_time": install_time,
      "campaign_id": campaign_id,
      "campaign": campaign,
      "adset_id": adset_id,
      "network": network,
    };
  }
}
