class UserModel {
  String? id;
  String? name;
  String? email;
  String? role;
  dynamic createdAt;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.role,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> user) => UserModel(
        id: user['id'],
        name: user['name'] ?? '',
        email: user['email'],
        role: user['role'],
        createdAt: user['createdAt'],
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name ?? '';
    data['email'] = email;
    data['role'] = role;
    data['createdAt'] = createdAt;
    return data;
  }
}
