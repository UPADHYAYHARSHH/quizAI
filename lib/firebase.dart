import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

DocumentReference<Object?>? getCurrentUser() {
  User? currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    DocumentReference currentUserRef =
        FirebaseFirestore.instance.collection('User').doc(currentUser.uid);
    return currentUserRef;
  } else {
    return null;
  }
}

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

Future<void> PlayedQuiz(
  DocumentReference? userRef,
  DocumentReference? quizRef,
  List<String>? selectedAnswers,
  int? correctAnswerCount,
  int? totalAnswerCount,
  String topicName,
  DateTime createdAt,
  int totalQuestion,
  bool isInvited,
  bool isAlreadyPlayed,
) async {
  CollectionReference QuizResult =
      FirebaseFirestore.instance.collection('QuizResult');
  QuizResult.add({
    'userRef': userRef,
    'quizRef': quizRef,
    'selectedAnswers': selectedAnswers,
    'correctAnswerCount': correctAnswerCount,
    'totalAnswerCount': totalAnswerCount,
    'topicName': topicName,
    'createdAt': createdAt,
    'totalQuestion': totalQuestion,
    'isInvited': isInvited,
    'isAlreadyPlayed': isAlreadyPlayed,
  });
}
