class TotalBalance {
  double? totalBalance;
  TotalBalance({required this.totalBalance});

  factory TotalBalance.fromJson(Map<String,dynamic> json) {
    return TotalBalance(totalBalance: double.tryParse(json["total_balance"].toString()));
  }

  toJson() {
    return {
      "totalBalance" : totalBalance
    };
  }
}
