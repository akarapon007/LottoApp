// To parse this JSON data, do
//
//     final userLoginReq = userLoginReqFromJson(jsonString);

import 'dart:convert';

UserLoginReq userLoginReqFromJson(String str) => UserLoginReq.fromJson(json.decode(str));

String userLoginReqToJson(UserLoginReq data) => json.encode(data.toJson());

class UserLoginReq {
    String identifier;
    String password;

    UserLoginReq({
        required this.identifier,
        required this.password,
    });

    factory UserLoginReq.fromJson(Map<String, dynamic> json) => UserLoginReq(
        identifier: json["identifier"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "password": password,
    };
}
