class UserModel {
  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
  });

  final int id;
  final String name;
  final String email;
  final String? avatar;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String?,
    );
  }
}
