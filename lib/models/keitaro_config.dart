class KeitaroConfig {
  String webview;

  KeitaroConfig({required this.webview});

  factory KeitaroConfig.fromJson(Map<String, dynamic> json) {
    return KeitaroConfig(
        webview: json["webview"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "webview": webview,
    };
  }
}
