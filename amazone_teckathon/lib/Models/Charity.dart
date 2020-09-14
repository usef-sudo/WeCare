import 'package:WeCare/Models/Event.dart';
import 'package:WeCare/Models/Requist.dart';

class Charity {
  String email;
  String password;
  String name;
  String discription;
  var logo;
  List<Request> charitydonations;
  List<Event> events;

  Charity(
      {this.discription,
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
      password: json['password']);
}
