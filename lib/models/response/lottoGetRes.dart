// To parse this JSON data, do
//
//     final lottoGetRes = lottoGetResFromJson(jsonString);

import 'dart:convert';

List<LottoGetRes> lottoGetResFromJson(String str) => List<LottoGetRes>.from(
    json.decode(str).map((x) => LottoGetRes.fromJson(x)));

String lottoGetResToJson(List<LottoGetRes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LottoGetRes {
  int lottery_id;
  int price;
  String number;
  String prize;
  dynamic uid;
  dynamic accepted;

  LottoGetRes({
    required this.lottery_id,
    required this.price,
    required this.number,
    required this.prize,
    required this.uid,
    required this.accepted,
  });

  factory LottoGetRes.fromJson(Map<String, dynamic> json) => LottoGetRes(
        lottery_id: json["lottery_id"],
        price: json["price"],
        number: json["number"],
        prize: json["prize"],
        uid: json["uid"],
        accepted: json["accepted"],
      );

  set lenth(int lenth) {}

  Map<String, dynamic> toJson() => {
        "lottery_id": lottery_id,
        "price": price,
        "number": number,
        "prize": prize,
        "uid": uid,
        "accepted": accepted,
      };
}