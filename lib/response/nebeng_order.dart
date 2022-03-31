import 'dart:convert';

NebengOrder nebengOrderFromJson(String str) => NebengOrder.fromJson(json.decode(str));

String nebengOrderToJson(NebengOrder data) => json.encode(data.toJson());

class NebengOrder {
    NebengOrder({
        this.id,
        this.usersId,
        this.nebengPostingId,
        this.rating,
        this.status,
        this.updatedAt,
        this.createdAt,
    });

    int? id;
    int? usersId;
    int? nebengPostingId;
    int? rating;
    int? status;
    DateTime? updatedAt;
    DateTime? createdAt;

    factory NebengOrder.fromJson(Map<String, dynamic> json) => NebengOrder(
        id: json["id"],
        usersId: json["users_id"],
        nebengPostingId: json["nebeng_posting_id"],
        rating: json["rating"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "users_id": usersId,
        "nebeng_posting_id": nebengPostingId,
        "rating": rating,
        "status": status,
        "updatedAt": updatedAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
    };
}