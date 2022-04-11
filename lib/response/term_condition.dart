// To parse this JSON data, do
//
//     final termCondition = termConditionFromJson(jsonString);

import 'dart:convert';

TermCondition termConditionFromJson(String str) => TermCondition.fromJson(json.decode(str));

String termConditionToJson(TermCondition data) => json.encode(data.toJson());

class TermCondition {
    TermCondition({
        this.id,
        this.skType,
        this.skDesc,
        this.createdAt,
        this.updatedAt,
        this.isDeleted,
    });

    int? id;
    String? skType;
    String? skDesc;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? isDeleted;

    factory TermCondition.fromJson(Map<String, dynamic> json) => TermCondition(
        id: json["id"],
        skType: json["sk_type"],
        skDesc: json["sk_desc"],
        createdAt:json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sk_type": skType,
        "sk_desc": skDesc,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "isDeleted": isDeleted,
    };
}
