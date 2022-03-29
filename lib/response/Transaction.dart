// To parse this JSON data, do
//
//     final transaction = transactionFromJson(jsonString);

import 'dart:convert';

Transaction transactionFromJson(String str) => Transaction.fromJson(json.decode(str));

String transactionToJson(Transaction data) => json.encode(data.toJson());

class Transaction {
    Transaction({
        this.id,
        this.riderId,
        this.orderId,
        this.datetimeSaldo,
        this.trxType,
        this.amount,
        this.note,
        this.createdAt,
        this.updatedAt,
        this.isDeleted,
    });

    int? id;
    int? riderId;
    int? orderId;
    DateTime? datetimeSaldo;
    int? trxType;
    int? amount;
    String? note;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? isDeleted;

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        riderId: json["rider_id"],
        orderId: json["order_id"],
        datetimeSaldo: json["datetime_saldo"] == null ? null : DateTime.parse(json["datetime_saldo"]),
        trxType: json["trx_type"],
        amount: json["amount"],
        note: json["note"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        isDeleted: json["isDeleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "rider_id": riderId,
        "order_id": orderId,
        "datetime_saldo": datetimeSaldo?.toIso8601String(),
        "trx_type": trxType,
        "amount": amount,
        "note": note,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "isDeleted": isDeleted,
    };
}
