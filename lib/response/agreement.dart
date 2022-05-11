import 'dart:convert';

Agreement agreementFromJson(String str) => Agreement.fromJson(json.decode(str));

String agreementToJson(Agreement data) => json.encode(data.toJson());

class Agreement {
    Agreement({
        this.id,
        this.riderId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.isDeleted,
    });

    int? id;
    int? riderId;
    int? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? isDeleted;

    factory Agreement.fromJson(Map<String, dynamic> json) => Agreement(
        id: json["id"],
        riderId: json["rider_id"],
        status: json["status"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "rider_id": riderId,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "isDeleted": isDeleted,
    };
}