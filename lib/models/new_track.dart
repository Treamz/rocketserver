class NewTrack {
  bool status;
  int id;
  int errorCode;
  String hashTrans;
  String orderId;
  String urlToPay;

  NewTrack({required this.status,
    required this.id,
    required this.errorCode,
    required this.hashTrans,
    required this.orderId,
    required this.urlToPay,
  });


  factory NewTrack.fromJson(Map<String, dynamic> json) {
    return NewTrack(status: json["status"],
        id: json["id"],
        errorCode: json["error_code"],
        hashTrans: json["hash_trans"],
        orderId: json["order_id"],
        urlToPay: json["url_to_pay"]);
  }

  toJson() {
    return {
      "status": status,
      "id": id,
      "errorCode": errorCode,
      "hashTrans": hashTrans,
      "orderId": orderId,
      "urlToPay": urlToPay,
    };
  }
}
