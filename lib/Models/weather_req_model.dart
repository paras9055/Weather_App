class WeatherReqModel {
  String? key;
  String? q;

  WeatherReqModel({this.key, this.q});

  WeatherReqModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    q = json['q'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['q'] = q;
    return data;
  }
}
