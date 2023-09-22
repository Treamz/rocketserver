class BalanceModel {
  int id;
  String userid;
  double amount;
  String advertisingId;
  String package;
  int status;

  BalanceModel({required this.userid,
    required this.id,
    required this.amount,
    required this.advertisingId,
    required this.package,
    required this.status,
  });


  factory BalanceModel.fromJson(Map<String, dynamic> json) {
    return BalanceModel(userid: json["userid"],
        id: json["id"],
        amount: double.parse(json["amount"].toString()),
        advertisingId: json["advertisingId"],
        package: json["package"],
        status: json["status"]);
  }

  toJson() {
    return {
      "userid": userid,
      "amount": amount,
      "advertisingId": advertisingId,
      "package": package,
      "status": status,
    };
  }
}
