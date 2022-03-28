import 'dart:convert';

Balance balanceFromJson(String str) => Balance.fromJson(json.decode(str));

String balanceToJson(Balance data) => json.encode(data.toJson());

class Balance {
    Balance({
        this.id,
        this.riderId,
        this.currBalance,
        this.createdAt,
        this.updatedAt,
        this.isDeleted,
    });

    int? id;
    int? riderId;
    int? currBalance;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? isDeleted;

    factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        id: json["id"],
        riderId: json["rider_id"],
        currBalance: json["curr_balance"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "rider_id": riderId,
        "curr_balance": currBalance,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "isDeleted": isDeleted,
    };
}