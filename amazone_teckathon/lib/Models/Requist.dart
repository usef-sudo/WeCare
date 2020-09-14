class Request {
  String phone;
  String location;
  String discription;
  String type;
  int money;
  int inprosses;
  Request({this.discription, this.phone, this.type, this.location,this.money,this.inprosses});

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$productFromJson(json);
}

Request _$productFromJson(Map<String, dynamic> json) {
  return Request(
    discription: json['discription'],
    type: json['type'].toString(),
    phone: json['phone'],
    location: json['location'],
    money: json['moneyRange'],
    inprosses: json['underProcess'],  );
}
