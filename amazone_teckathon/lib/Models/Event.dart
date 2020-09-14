import 'package:WeCare/Models/Charity.dart';

class Event {
  String name;
  Charity owner;
  String discription;
  int money;
  int inprosses;

  Event({this.discription, this.name, this.owner, this.money, this.inprosses});

  factory Event.fromJson(Map<String, dynamic> json) => _$productFromJson(json);
}

Event _$productFromJson(Map<String, dynamic> json) {
  return Event(
    discription: json['discreption'],
    name: json['name'],
    owner: json['owner'],
    money: json['moneyRange'],
    inprosses: json['underProcess'],
  );
}
