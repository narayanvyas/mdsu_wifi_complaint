// Flutter imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '/models/complaint_model.dart';

import '../app/controllers/global_controller.dart';
import '../app/global.dart';
import '../app/modules/auth/controllers/auth_controller.dart';
import '../app/routes/app_pages.dart';
import '../models/user_model.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final databaseReference = FirebaseFirestore.instance;

class Database {
  /// Create new user to Firebase Authentication and storage data to the database
  Future<void> createComplaint(String id, String name, String email,
      String complaint, dynamic complaintJson, Map<String, num> location,
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
        'status': 'Unresolved',
        'latitude': location['latitude'],
        'longitude': location['longitude'],
        'createdAt': FieldValue.serverTimestamp(),
      });
      await databaseReference
          .collection("COMPLAINTS")
          .doc(complaintModel.id)
          .set(complaintModel.toJson());
    } catch (e) {
      debugPrint(e.toString());
      showSnackbar('Error Creating Complaint', Status.failed);
    }
  }

  /// Create new user to Firebase Authentication and storage data to the database
  Future<void> updateComplaint(ComplaintModel complaint, String status) async {
    try {
      final ComplaintModel complaintModel =
          ComplaintModel.fromJson(complaint.toJson());
      complaintModel.status = status;
      await databaseReference
          .collection("COMPLAINTS")
          .doc(complaintModel.id)
          .update(complaintModel.toJson());
    } catch (e) {
      debugPrint(e.toString());
      showSnackbar('Error Creating Complaint', Status.failed);
    }
  }

  /// Get User Data
  Future<UserModel?> getUser(String uid) async {
    try {
      var doc = await databaseReference.collection("USERS").doc(uid).get();
      return UserModel.fromJson(doc.data()!);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  /// Login User
  Future<void> loginUser(String email, String password) async {
    Get.find<AuthController>().isLoading.value = true;
    try {
      Get.focusScope!.unfocus();
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        Get.find<GlobalController>().user.value =
            await getUser(value.user!.uid) ?? UserModel();
        Get.toNamed(Routes.HOME);
      });
      Get.find<AuthController>().loginEmailController.text = '';
      Get.find<AuthController>().loginPasswordController.text = '';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackbar('No user found with this email address', Status.failed);
      } else if (e.code == 'wrong-password') {
        showSnackbar('Invalid Password', Status.failed);
      } else if (e.code == 'too-many-requests') {
        showSnackbar(
            'Too may failed login attempts, reset your password to login immediately.',
            Status.failed);
      } else {
        showSnackbar('Some Error Occured', Status.failed);
      }
    }
    Get.find<AuthController>().isLoading.value = false;
  }

  // Optimized Version of Streams
  Stream<List<ComplaintModel>> complaintsStream() {
    return databaseReference
        .collection("COMPLAINTS")
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((query) =>
            query.docs.map((e) => ComplaintModel.fromJson(e.data())).toList());
  }
}
