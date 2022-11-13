class ComplaintModel {
  String? id;
  String? name;
  String? email;
  String? complaint;
  String? department;
  List<String>? to;
  dynamic message;

  ComplaintModel({
    this.id,
    this.name,
    this.email,
    this.complaint,
    this.department,
    this.to,
    this.message,
  });

  factory ComplaintModel.fromJson(Map<String, dynamic> complaint) =>
      ComplaintModel(
        id: complaint['id'],
        name: complaint['name'] ?? '',
        email: complaint['email'],
        complaint: complaint['complaint'],
        department: complaint['department'],
        to: complaint['to'] ?? [],
        message: complaint['message'],
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name ?? '';
    data['email'] = email;
    data['complaint'] = complaint ?? '';
    data['department'] = department ?? '';
    data['to'] = to;
    data['message'] = message;
    return data;
  }
}
