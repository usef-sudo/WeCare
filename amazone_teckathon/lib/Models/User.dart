

class User {
  String email;
  String password;
  String name;
  int age;

  User({this.email, this.age, this.name, this.password});

  factory User.fromJson(Map<String, dynamic> json) => _$productFromJson(json);
}

User _$productFromJson(Map<String, dynamic> json) {
  return User(
      email: json['email'],
      age: json['age'],
      name: json['name'],
      password: json['password']);
}
