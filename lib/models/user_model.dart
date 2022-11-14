class UserModel {
  String? id;
  String? name;
  String? email;
  String? role;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> user) => UserModel(
        id: user['id'],
        name: user['name'] ?? '',
        email: user['email'],
        role: user['role'],
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name ?? '';
    data['email'] = email;
    data['role'] = role;
    return data;
  }
}
