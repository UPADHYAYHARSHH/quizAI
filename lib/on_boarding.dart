// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quiz/login.dart';
import 'package:quiz/sign_up.dart';

import 'components/custom_button.dart';
import 'components/custom_button2.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int currentpage = 0;

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16,
            bottom: 20,
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/images/FirstImage.png'),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 16.0,
                            right: 16,
                          ),
                          child: Text(
                            'Create, share, challenge and Play quizzes whenever and wherever you want.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 20,
                              color: Color(
                                0xFF263238,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('assets/images/FirstImage.png'),
                        const Text(
                          'Create fun and interesting quizzes to boost your knowledge.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 20,
                            color: Color(
                              0xFF263238,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('images/FirstImage.png'),
                        const Text(
                          'Play and take quiz challenges together with your friends at a time.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 20,
                            color: Color(
                              0xFF263238,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                  onPageChanged: (index) {
                    setState(() {
                      currentpage = index;
                    });
                  },
                ),
              ),
              pageIndicator(),
              const SizedBox(
                height: 180,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Sign(),
                    ),
                  );
                },
                child: const CustomButton(buttonText: 'GET STARTED'),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
                },
                child: const CustomButton2(
                  buttonText: 'I ALREADY HAVE AN ACCOUNT',
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget pageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        currentpage == 0
            ? Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Container(
                  width: 30,
                  height: 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: Colors.blue,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Container(
                  width: 10,
                  height: 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                    color: Colors.grey,
                  ),
                ),
              ),
        currentpage == 1
            ? Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Container(
                  width: 30,
                  height: 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: Colors.blue,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Container(
                  width: 10,
                  height: 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                    color: Colors.grey,
                  ),
                ),
              ),
        currentpage == 2
            ? Container(
                width: 30,
                height: 7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  color: Colors.blue,
                ),
              )
            : Container(
                width: 10,
                height: 7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    50,
                  ),
                  color: Colors.grey,
                ),
              ),
      ],
    );
  }
}
