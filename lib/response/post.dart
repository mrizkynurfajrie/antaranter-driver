// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
    Post({
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
        this.note,
        this.createdAt,
        this.updatedAt,
        this.isDeleted,
    });

    int? id;
    int? riderId;
    DateTime? datetimeStart;
    DateTime? datetimeFinish;
    String? cityOrigin;
    String? cityDestination;
    DateTime? dateDep;
    DateTime? dateArr;
    String? timeDep;
    String? timeArr;
    int? seatAvail;
    int? price;
    int? status;
    String? note;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? isDeleted;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        riderId: json["rider_id"],
        datetimeStart: json["datetimeStart"] == null ? null : DateTime.parse(json["datetimeStart"]),
        datetimeFinish: json["datetimeFinish"] == null ? null : DateTime.parse(json["datetimeFinish"]),
        cityOrigin: json["city_origin"],
        cityDestination: json["city_destination"],
        dateDep: json["dateDep"] == null ? null : DateTime.parse(json["dateDep"]),
        dateArr: json["dateArr"] == null ? null : DateTime.parse(json["dateArr"]),
        timeDep: json["timeDep"],
        timeArr: json["timeArr"],
        seatAvail: json["seatAvail"],
        price: json["price"],
        status: json["status"],
        note: json["note"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
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
        "note": note,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "isDeleted": isDeleted,
    };
}
