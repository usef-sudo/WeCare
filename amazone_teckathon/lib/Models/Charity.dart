

import 'package:amazone_teckathon/Models/Event.dart';
import 'package:amazone_teckathon/Models/Requist.dart';

class Charity {
  String email;
  String password;
  String name;
  String discription;
  var logo;
  List<Request> charitydonations;
  List<Event> events;
  String accountnumber;

  Charity(
      {this.discription,
        this.accountnumber,
      this.charitydonations,
      this.email,
      this.events,
      this.logo,
      this.name,
      this.password});

  factory Charity.fromJson(Map<String, dynamic> json) =>
      _$productFromJson(json);
}

Charity _$productFromJson(Map<String, dynamic> json) {
  return Charity(
      discription: json['discreption'].toString(),
      charitydonations: json['charityDonations'],
      email: json['email'],
      events: json['events'],
      logo: json['logo'],
      name: json['name'],
      accountnumber: json["bankAccount"],
      password: json['password']);
}
