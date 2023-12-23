import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:quiz/login.dart";

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FloatingActionButton(
          onPressed: () async {
            await auth.signOut();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
            );
          },
        ),
      ),
    );
  }
}
