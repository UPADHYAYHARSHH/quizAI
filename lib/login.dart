import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quiz/custom_bottom_bar.dart';
import 'package:quiz/sign_up.dart';
import 'package:quiz/utils/utils.dart';

import 'components/custom_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
      email: emailController.text.toString(),
      password: passwordController.text.toString(),
    )
        .then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CustomBottomBar(),
        ),
      );
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage(
        error.toString(),
      );
      setState(() {
        loading = false;
      });
    });
  }

  String? name, imageUrl, userEmail, uid;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'asset/images/quiz_logo.svg',
                      width: 236,
                      height: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Sign In to continue',
                          style: TextStyle(
                            color: Color(0xFF263238),
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Email Address',
                          style: TextStyle(
                            color: Color(0xFFACB1C0),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email id';
                      }
                      return null;
                    },
                    autofocus: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFEDEEF1),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(
                        color: Color(0xFFACB1C0),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value!.length < 8) {
                        return 'Password should be more than 8 digit';
                      }
                      return null;
                    },
                    autofocus: false,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8,
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFEDEEF1),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: Color(0xFF2F7FCE),
                        fontSize: 10,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: CustomButton(
                      loading: loading,
                      buttonText: 'Sign In',
                    ),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        login();
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Center(
                    child: Text(
                      'or',
                      style: TextStyle(
                        color: Color(0xFFACB1C0),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          signInWithGoogle(context);
                        },
                        child: const Icon(
                          Icons.facebook_sharp,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Don’t have an account? ',
                          style: TextStyle(
                            color: Color(0xFF455A64),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => const Sign(),
                          text: 'Create Account',
                          style: const TextStyle(
                            color: Color(0xFF2F7FCE),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await _auth.signInWithCredential(authCredential);
      User? user = result.user;

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const CustomBottomBar()));
      // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }
}
