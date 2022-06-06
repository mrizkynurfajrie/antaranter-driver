// To parse this JSON data, do
//
//     final region = regionFromJson(jsonString);

import 'dart:convert';

Region regionFromJson(String str) => Region.fromJson(json.decode(str));

String regionToJson(Region data) => json.encode(data.toJson());

class Region {
    Region({
        this.id,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.isDeleted,
        this.deletedAt,
    });

    int? id;
    String? name;
    String? createdAt;
    String? updatedAt;
    int? isDeleted;
    String? deletedAt;

    factory Region.fromJson(Map<String, dynamic> json) => Region(
        id: json["id"],
        name: json["name"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        isDeleted: json["isDeleted"],
        deletedAt: json["deletedAt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "isDeleted": isDeleted,
        "deletedAt": deletedAt,
    };
}
