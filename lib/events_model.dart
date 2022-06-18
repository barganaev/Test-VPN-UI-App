import 'dart:convert';

EventsModel eventsModelFromJson(String str) => EventsModel.fromJson(json.decode(str));

String eventsModelToJson(EventsModel data) => json.encode(data.toJson());

class EventsModel {
  EventsModel({
    this.date,
  });

  final List<Date>? date;

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
    date: json["date"] == null ? null : List<Date>.from(json["date"].map((x) => Date.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": date == null ? null : List<dynamic>.from(date!.map((x) => x.toJson())),
  };
}

class Date {
  Date({
    this.name,
    this.names,
    this.icons,
    this.cashes,
  });

  final String? name;
  final List<String>? names;
  final List<String>? icons;
  final List<String>? cashes;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    name: json["name"] == null ? null : json["name"],
    names: json["names"] == null ? null : List<String>.from(json["names"].map((x) => x)),
    icons: json["icons"] == null ? null : List<String>.from(json["icons"].map((x) => x)),
    cashes: json["cashes"] == null ? null : List<String>.from(json["cashes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "names": names == null ? null : List<dynamic>.from(names!.map((x) => x)),
    "icons": icons == null ? null : List<dynamic>.from(icons!.map((x) => x)),
    "cashes": cashes == null ? null : List<dynamic>.from(cashes!.map((x) => x)),
  };
}
