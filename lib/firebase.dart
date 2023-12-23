import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSetup(String firstName, String email) async {
  CollectionReference users = FirebaseFirestore.instance.collection('User');
  FirebaseAuth auth = FirebaseAuth.instance;
  String? uid = auth.currentUser?.uid.toString();
  DocumentReference userRef = await users.add({
    'firstName': firstName,
    'email': email,
    'uid': uid,
  });
}

Future<void> quiz(
  DocumentReference? userRef,
  String noOfQuestions,
  String topicName,
  bool isChallangedQuiz,
  DateTime createdAt,
) async {
  CollectionReference quiz = FirebaseFirestore.instance.collection('Quiz');
  quiz.add({
    'userRef': userRef,
    'noOfQuestions': noOfQuestions,
    'topicName': topicName,
    'isChallangedQuiz': isChallangedQuiz,
    'createdAt': createdAt,
  });
}
