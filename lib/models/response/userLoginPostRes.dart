// To parse this JSON data, do
//
//     final userLoginPostRes = userLoginPostResFromJson(jsonString);

import 'dart:convert';

List<UserLoginPostRes> userLoginPostResFromJson(String str) => List<UserLoginPostRes>.from(
  json.decode(str).map((x) => UserLoginPostRes.fromJson(x)));


String userLoginPostResToJson(List<UserLoginPostRes> data) => 
  json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserLoginPostRes {
    int uid;
    String username;
    String email;
    String phone;
    String password;
    int? balance;
    String type;
    String? img;

    UserLoginPostRes({
        required this.uid,
        required this.username,
        required this.email,
        required this.phone,
        required this.password,
        required this.balance,
        required this.type,
        required this.img,
    });

    factory UserLoginPostRes.fromJson(Map<String, dynamic> json) => UserLoginPostRes(
        uid: json["uid"],
        username: json["username"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        balance: json["balance"],
        type: json["type"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
        "balance": balance,
        "type": type,
        "img": img,
    };
}
