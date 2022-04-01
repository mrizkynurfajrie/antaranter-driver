// import 'dart:convert';

// Rider riderFromJson(String str) => Rider.fromJson(json.decode(str));

// String? riderToJson(Rider data) => json.encode(data.toJson());

// class Rider {
//   Rider({
//      this.id,
//      this.name,
//      this.email,
//      this.nik,
//      this.ktpPict,
//      this.image,
//      this.birth,
//      this.address,
//      this.phone,
//      this.password,
//      this.status,
//      this.accountApprove,
//      this.cityLocation,
//      this.role,
//      this.fcm,
//      this.accountRegis,
//      this.createdAt,
//      this.updatedAt,
//      this.isDeleted,
//   });

//   int? id;
//   String? name;
//   String? email;
//   String? nik;
//   String? ktpPict;
//   String? image;
//   DateTime? birth;
//   String? address;
//   String? phone;
//   String? password;
//   int? status;
//   DateTime? accountApprove;
//   String? cityLocation;
//   String? role;
//   String? fcm;
//   DateTime? accountRegis;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? isDeleted;

//   factory Rider.fromJson(Map<String, dynamic> json) => Rider(
//         id: json["id"],
//         name: json["name"],
//         email: json["email"],
//         nik: json["nik"],
//         ktpPict: json["ktp_pict"],
//         image: json["image"],
//         birth: json["birth"] == null ? null : DateTime.parse(json["birth"]),
//         address: json["address"],
//         phone: json["phone"],
//         password: json["password"],
//         status: json["status"],
//         accountApprove: json["account_approve"] == null ? null : DateTime.parse(json["account_approve"]),
//         cityLocation: json["cityLocation"],
//         role: json["role"],
//         fcm: json["fcm"],
//         accountRegis: json["account_regis"] == null ? null : DateTime.parse(json["account_regis"]),
//         createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//         isDeleted: json["isDeleted"],
//       );

//   Map<String?, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "email": email,
//         "nik": nik,
//         "ktp_pict": ktpPict,
//         "image": image,
//         "birth": birth?.toIso8601String(),
//         "address": address,
//         "phone": phone,
//         "password": password,
//         "status": status,
//         "account_approve": accountApprove?.toIso8601String(),
//         "cityLocation": cityLocation,
//         "role": role,
//         "fcm": fcm,
//         "account_regis": accountRegis?.toIso8601String(),
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "isDeleted": isDeleted,
//       };
// }
