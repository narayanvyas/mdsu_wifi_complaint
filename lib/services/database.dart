// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wifi_complaint/models/complaint_model.dart';

import '../app/global.dart';

final databaseReference = FirebaseFirestore.instance;

class Database {
  /// Create new user to Firebase Authentication and storage data to the database
  Future<void> createComplaint(String id, String name, String email,
      String complaint, dynamic complaintJson,
      {String? department}) async {
    try {
      final ComplaintModel complaintModel = ComplaintModel.fromJson({
        'id': id,
        'name': name,
        'email': email,
        'complaint': complaint,
        'department': department ?? '',
        'to': [email],
        'message': complaintJson,
      });
      await databaseReference
          .collection("mail")
          .doc(complaintModel.id)
          .set(complaintModel.toJson());
    } catch (e) {
      debugPrint(e.toString());
      showSnackbar('Error Creating Complaint', Status.failed);
    }
  }
}
