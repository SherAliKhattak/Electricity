
class UserModel{
  String? name;
  String? email;
  String? password;

  UserModel({this.name,this.email,this.password});

  factory UserModel.fromJson(map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
     
    );
  }
  toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      
    };
  }
}