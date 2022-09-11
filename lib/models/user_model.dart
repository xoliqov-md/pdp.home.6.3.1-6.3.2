class User {

  String name;
  String email;
  String password;
  String number;

  User({required this.name, required this.email, required this.password, required this.number});

  User.from({required this.name , required this.email, required this.password, required this.number});

  User.fromJson(Map json)
      :
      name = json['name'],
      email = json['email'],
      password = json['password'],
      number = json['number'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'email':email,
    'password':password,
    'number': number
  };

}