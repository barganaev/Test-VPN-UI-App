// import 'dart:convert';
//
// EventsModel eventsModelFromJson(String str) => EventsModel.fromJson(json.decode(str));
//
// String eventsModelToJson(EventsModel data) => json.encode(data.toJson());
//
// class EventsModel {
//   EventsModel({
//     this.date,
//   });
//
//   final List<Date>? date;
//
//   factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
//     date: json["date"] == null ? null : List<Date>.from(json["date"].map((x) => Date.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "date": date == null ? null : List<dynamic>.from(date!.map((x) => x.toJson())),
//   };
// }
//
// class Date {
//   Date({
//     this.yesterday,
//     this.satDec11,
//     this.thursDec9,
//   });
//
//   final List<SatDec11>? yesterday;
//   final List<SatDec11>? satDec11;
//   final List<SatDec11>? thursDec9;
//
//   factory Date.fromJson(Map<String, dynamic> json) => Date(
//     yesterday: json["yesterday"] == null ? null : List<SatDec11>.from(json["yesterday"].map((x) => SatDec11.fromJson(x))),
//     satDec11: json["Sat, Dec 11"] == null ? null : List<SatDec11>.from(json["Sat, Dec 11"].map((x) => SatDec11.fromJson(x))),
//     thursDec9: json["Thurs, Dec 9"] == null ? null : List<SatDec11>.from(json["Thurs, Dec 9"].map((x) => SatDec11.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "yesterday": yesterday == null ? null : List<dynamic>.from(yesterday!.map((x) => x.toJson())),
//     "Sat, Dec 11": satDec11 == null ? null : List<dynamic>.from(satDec11!.map((x) => x.toJson())),
//     "Thurs, Dec 9": thursDec9 == null ? null : List<dynamic>.from(thursDec9!.map((x) => x.toJson())),
//   };
// }
//
// class SatDec11 {
//   SatDec11({
//     this.name,
//     this.icon,
//   });
//
//   final String? name;
//   final String? icon;
//
//   factory SatDec11.fromJson(Map<String, dynamic> json) => SatDec11(
//     name: json["name"] == null ? null : json["name"],
//     icon: json["icon"] == null ? null : json["icon"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name == null ? null : name,
//     "icon": icon == null ? null : icon,
//   };
// }


// To parse this JSON data, do
//
//     final eventsModel = eventsModelFromJson(jsonString);

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
