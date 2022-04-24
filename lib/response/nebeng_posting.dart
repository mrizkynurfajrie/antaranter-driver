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
    this.datetimeStart,
    this.datetimeFinish,
    this.cityOrigin,
    this.cityDestination,
    this.dateDep,
    this.dateArr,
    this.timeDep,
    this.timeArr,
    this.seatAvail,
    this.price,
    this.status,
    this.statusUpdate,
    this.note,
    this.createdAt,
    this.updatedAt,
    this.isDeleted,
    this.count,
  });

  int? id;
  int? riderId;
  DateTime? datetimeStart;
  DateTime? datetimeFinish;
  String? cityOrigin;
  String? cityDestination;
  DateTime? dateDep;
  DateTime? dateArr;
  dynamic timeDep;
  dynamic timeArr;
  int? seatAvail;
  int? price;
  int? status;
  int? statusUpdate;
  String? note;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? isDeleted;
  int? count;
  
  get remainingSeat => seatAvail! - count!;

  factory NebengPosting.fromJson(Map<String, dynamic> json) => NebengPosting(
        id: json["id"],
        riderId: json["rider_id"],
        datetimeStart: json["datetimeStart"] == null ? null : DateTime.parse(json["datetimeStart"]),
        datetimeFinish: json["datetimeFinish"] == null ? null : DateTime.parse(json["datetimeFinish"]),
        cityOrigin: json["city_origin"],
        cityDestination: json["city_destination"],
        dateDep:
            json["dateDep"] == null ? null : DateTime.parse(json["dateDep"]),
        dateArr: json["dateArr"] == null ? null : DateTime.parse(json["dateArr"]),
        timeDep: json["timeDep"],
        timeArr: json["timeArr"],
        seatAvail: json["seatAvail"],
        price: json["price"],
        status: json["status"],
        statusUpdate: json["status_update"],
        note: json["note"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rider_id": riderId,
        "datetimeStart": datetimeStart?.toIso8601String(),
        "datetimeFinish": datetimeFinish?.toIso8601String(),
        "city_origin": cityOrigin,
        "city_destination": cityDestination,
        "dateDep": dateDep?.toIso8601String(),
        "dateArr": dateArr?.toIso8601String(),
        "timeDep": timeDep,
        "timeArr": timeArr,
        "seatAvail": seatAvail,
        "price": price,
        "status": status,
        "status_update": statusUpdate,
        "note": note,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "isDeleted": isDeleted,
        "count": count,
      };
}
