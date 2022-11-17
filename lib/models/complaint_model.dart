class ComplaintModel {
  String? id;
  String? name;
  String? email;
  String? complaint;
  String? department;
  List<dynamic>? to;
  dynamic message;
  String? status;
  double? latitude;
  double? longitude;
  String? remarks;
  String? type;
  String? resolvedByUserId;
  String? resolvedByUserName;
  dynamic resolvedAt;
  dynamic createdAt;

  ComplaintModel({
    this.id,
    this.name,
    this.email,
    this.complaint,
    this.department,
    this.to,
    this.message,
    this.status,
    this.latitude,
    this.longitude,
    this.remarks,
    this.type,
    this.resolvedByUserId,
    this.resolvedByUserName,
    this.resolvedAt,
    this.createdAt,
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
        status: complaint['status'],
        latitude: complaint['latitude'] ?? 0.0,
        longitude: complaint['longitude'] ?? 0.0,
        remarks: complaint['remarks'],
        type: complaint['type'],
        resolvedByUserId: complaint['resolvedByUserId'],
        resolvedByUserName: complaint['resolvedByUserName'],
        resolvedAt: complaint['resolvedAt'],
        createdAt: complaint['createdAt'],
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name ?? '';
    data['email'] = email;
    data['complaint'] = complaint ?? '';
    data['department'] = department ?? '';
    data['to'] = to;
    data['message'] = message ?? {};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['status'] = status;
    data['type'] = type;
    data['remarks'] = remarks;
    data['resolvedByUserId'] = resolvedByUserId;
    data['resolvedByUserName'] = resolvedByUserName;
    data['resolvedAt'] = resolvedAt;
    data['createdAt'] = createdAt;
    return data;
  }
}
