// To parse this JSON data, do
//
//     final userLoginReq = userLoginReqFromJson(jsonString);

import 'dart:convert';

UserLoginReq userLoginReqFromJson(String str) => UserLoginReq.fromJson(json.decode(str));

String userLoginReqToJson(UserLoginReq data) => json.encode(data.toJson());

class UserLoginReq {
    String phone;
    String password;

    UserLoginReq({
        required this.phone,
        required this.password,
    });

    factory UserLoginReq.fromJson(Map<String, dynamic> json) => UserLoginReq(
        phone: json["phone"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "phone": phone,
        "password": password,
    };
}
