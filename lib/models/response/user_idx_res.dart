// To parse this JSON data, do
//
//     final userIdxRes = userIdxResFromJson(jsonString);

import 'dart:convert';

List<UserIdxRes> userIdxResFromJson(String str) => List<UserIdxRes>.from(
  json.decode(str).map((x) => UserIdxRes.fromJson(x)));

String userIdxResToJson(List<UserIdxRes> data) => 
  json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserIdxRes {
    int uid;
    String username;
    String email;
    String phone;
    String password;
    int? balance;
    String type;

    UserIdxRes({
        required this.uid,
        required this.username,
        required this.email,
        required this.phone,
        required this.password,
        required this.balance,
        required this.type,
    });

    factory UserIdxRes.fromJson(Map<String, dynamic> json) => UserIdxRes(
        uid: json["uid"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        balance: json["balance"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
        "balance": balance,
        "type": type,
    };
}
