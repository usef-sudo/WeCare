class Donation {
  int ID;
  String phone;
  String location;
  String discription;
  bool pick;
  var images;

  Donation(
      {this.discription,
      this.phone,
      this.pick,
      this.location,
      this.images,
      this.ID});

  factory Donation.fromJson(Map<String, dynamic> json) =>
      _$productFromJson(json);
}

Donation _$productFromJson(Map<String, dynamic> json) {
  return Donation(
    ID: json['id'],
    discription: json['discription'],
    images: json['images'],
    pick: json['pick'],
    phone: json['phone'],
    location: json['location'],
  );
}
