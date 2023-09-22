class ConversionModel {
  String devToken;
  String af_status;
  String auid;
  String install_time;
  String af_message;
  String adset_id;
  String campaign_id;
  String campaign;
  String network;
  String adid;
  String package;
  String advertisingId;

  ConversionModel(
      {required this.package,
        required this.advertisingId,
      required this.devToken,
      required this.af_status,
      required this.auid,
      required this.install_time,
      required this.af_message,
      required this.adset_id,
      required this.campaign_id,
      required this.campaign,
      required this.network,
      required this.adid});

  toJson() {
    return {
      "package": package,
      "devToken": devToken,
      "af_status": af_status,
      "auid": auid,
      "install_time": install_time,
      "af_message": af_message,
      "adset_id": adset_id,
      "campaign_id": campaign_id,
      "campaign": campaign,
      "network": network,
      "adid": adid,
      "advertisingId":advertisingId
    };
  }
}
