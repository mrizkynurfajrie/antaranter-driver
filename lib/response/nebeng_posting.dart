// To parse this JSON data, do
//
//     final nebengPosting = nebengPostingFromJson(jsonString);

import 'dart:convert';

NebengPosting nebengPostingFromJson(String str) =>
    NebengPosting.fromJson(json.decode(str));

String nebengPostingToJson(NebengPosting data) => json.encode(data.toJson());

class NebengPosting {
  NebengPosting({
    this.id,
    this.riderId,
    this.cityOrigin,
    this.cityDestination,
    this.dateDep,
    this.dateArr,
    this.timeDep,
    this.timeArr,
    this.seatAvail,
    this.price,
    this.status,
    this.updatedAt,
    this.createdAt,
  });

  int? id;
  int? riderId;
  String? cityOrigin;
  String? cityDestination;
  DateTime? dateDep;
  DateTime? dateArr;
  String? timeDep;
  String? timeArr;
  int? seatAvail;
  int? price;
  int? status;
  DateTime? updatedAt;
  DateTime? createdAt;

  factory NebengPosting.fromJson(Map<String, dynamic> json) => NebengPosting(
        id: json["id"],
        riderId: json["rider_id"],
        cityOrigin: json["city_origin"],
        cityDestination: json["city_destination"],
        dateDep:
            json["dateDep"] == null ? null : DateTime.parse(json["dateDep"]),
        dateArr:
            json["dateArr"] == null ? null : DateTime.parse(json["dateArr"]),
        timeDep: json["timeDep"],
        timeArr: json["timeArr"],
        seatAvail: json["seatAvail"],
        price: json["price"],
        status: json["status"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rider_id": riderId,
        "city_origin": cityOrigin,
        "city_destination": cityDestination,
        "dateDep": dateDep?.toIso8601String(),
        "dateArr": dateArr?.toIso8601String(),
        "timeDep": timeDep,
        "timeArr": timeArr,
        "seatAvail": seatAvail,
        "price": price,
        "status": status,
        "updatedAt": updatedAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
      };
}
