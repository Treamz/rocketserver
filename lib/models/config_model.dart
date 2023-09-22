class Config {
  String? installer;

  Config({
    required this.installer,
  });

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config(installer: json["installer"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "installer": installer,
    };
  }
}
