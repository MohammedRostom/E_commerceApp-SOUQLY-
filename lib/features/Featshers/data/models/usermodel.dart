class UserModel {
  String username;
  String password;

  UserModel({
    required this.username,
    required this.password,
  });
  // Factory constructor for creating instances of UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      username: data['username'],
      password: data['password'],
    );
  }
}
