import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz/custom_bottom_bar.dart';
import 'package:quiz/firebase.dart';

import 'components/custom_button.dart';
import 'login.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  bool loading = false;
  bool passwordVisible = false;
  bool passwordVisible2 = false;
  bool isChecked = false;
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _pass.dispose();
    _confirmPass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'images/quiz_logo.svg',
                  width: 236,
                  height: 100,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Sign Up to Get Started',
                    style: TextStyle(
                      color: Color(0xFF263238),
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Align(
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
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email id';
                    }
                    return null;
                  },
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
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 30,
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
                  obscureText: passwordVisible,
                  controller: _pass,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  autofocus: false,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                    ),
                    filled: true,
                    fillColor: const Color(
                      0xFFEDEEF1,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            passwordVisible = !passwordVisible;
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Confirm Password',
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
                  obscureText: passwordVisible2,
                  controller: _confirmPass,
                  validator: (val) {
                    if (val!.isEmpty) return 'Empty';
                    if (val != _pass.text) {
                      return 'Password and confirm password does not match';
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
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordVisible2
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            passwordVisible2 = !passwordVisible2;
                          },
                        );
                      },
                    ),
                  ),
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                      width: 10,
                      child: CheckboxListTile(
                        activeColor: Colors.blue,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        subtitle: !isChecked
                            ? const Padding(
                                padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                                child: Text(
                                  'Required field',
                                  style: TextStyle(
                                      color: Color(0xFFe53935), fontSize: 12),
                                ),
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Expanded(
                      child: Text(
                        'By agreeing of the terms and conditions, you are entering into a totally binding contract with the service provider.',
                        style: TextStyle(
                          color: Color(0xFFACB1C0),
                          // fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                InkWell(
                  child: CustomButton(
                    loading: loading,
                    buttonText: 'Sign Up',
                  ),
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });
                      // If the form is valid, display a snack-bar. In the real world,
                      // you'd often call a server or save the information in a database.
                      await _auth.createUserWithEmailAndPassword(
                        email: _email.text.toString(),
                        password: _pass.text.toString(),
                      );
                      userSetup('Harsh', _email.text).then(
                        (value) => setState(
                          () {
                            loading = false;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CustomBottomBar(),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Already have an account? ',
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
                              ..onTap = () => const Login(),
                            text: 'Login',
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
