class SportsResModel {
  List<Football>? football;
  List<Football>? cricket;
  List<Football>? golf;

  SportsResModel({this.football, this.cricket, this.golf});

  SportsResModel.fromJson(Map<String, dynamic> json) {
    if (json['football'] != null) {
      football = <Football>[];
      json['football'].forEach((v) {
        football!.add(Football.fromJson(v));
      });
    }
    if (json['cricket'] != null) {
      cricket = <Football>[];
      json['cricket'].forEach((v) {
        cricket!.add(Football.fromJson(v));
      });
    }
    if (json['golf'] != null) {
      golf = <Football>[];
      json['golf'].forEach((v) {
        golf!.add(Football.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (football != null) {
      data['football'] = football!.map((v) => v.toJson()).toList();
    }
    if (cricket != null) {
      data['cricket'] = cricket!.map((v) => v.toJson()).toList();
    }
    if (golf != null) {
      data['golf'] = golf!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Football {
  String? stadium;
  String? country;
  String? region;
  String? tournament;
  String? start;
  String? match;

  Football({this.stadium, this.country, this.region, this.tournament, this.start, this.match});

  Football.fromJson(Map<String, dynamic> json) {
    stadium = json['stadium'];
    country = json['country'];
    region = json['region'];
    tournament = json['tournament'];
    start = json['start'];
    match = json['match'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stadium'] = stadium;
    data['country'] = country;
    data['region'] = region;
    data['tournament'] = tournament;
    data['start'] = start;
    data['match'] = match;
    return data;
  }
}
