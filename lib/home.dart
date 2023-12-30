import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quiz/app_state.dart';
import 'package:quiz/quiz.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

User? user = FirebaseAuth.instance.currentUser;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Hi, ${user?.displayName ?? 'User'} ${'👋🏻'}',
                style: const TextStyle(
                  color: Color(
                    0xFF263238,
                  ),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Let’s Prepare together!',
                style: TextStyle(
                  color: Color(
                    0xFF455A64,
                  ),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Challenges',
                    style: TextStyle(
                      color: Color(
                        0xFF263238,
                      ),
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  Text(
                    'View All',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(
                        0xFF263238,
                      ),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 250,
                      height: 200,
                      decoration: ShapeDecoration(
                        color: const Color(
                          0xFFE6F2FF,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 117,
                            // right: 3.57,
                            child: Container(
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                ),
                              ),
                              child: Opacity(
                                opacity: 0.80,
                                child: Image.asset(
                                  'asset/images/bulb_bg.png',
                                  scale: 1,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                              left: 15.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Technology',
                                  style: TextStyle(
                                    color: Color(0xFF263238),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  'Total 50 Questions',
                                  style: TextStyle(
                                    color: Color(
                                      0xFF2F7FCE,
                                    ),
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  width: 164,
                                  height: 4,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 164,
                                          height: 4,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 143.86,
                                          height: 4,
                                          decoration: ShapeDecoration(
                                            color: const Color(
                                              0xFF2F7FCE,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  '12 Questions Answered',
                                  style: TextStyle(
                                    color: Color(
                                      0xFF455A64,
                                    ),
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 250,
                      height: 200,
                      decoration: ShapeDecoration(
                        color: const Color(
                          0xFFE6F2FF,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 117,
                            // right: 3.57,
                            child: Container(
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                ),
                              ),
                              child: Opacity(
                                opacity: 0.80,
                                child: Image.asset(
                                  'asset/images/bulb_bg.png',
                                  scale: 1,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                              left: 15.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Technology',
                                  style: TextStyle(
                                    color: Color(
                                      0xFF263238,
                                    ),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  'Total 50 Questions',
                                  style: TextStyle(
                                    color: Color(
                                      0xFF2F7FCE,
                                    ),
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  width: 164,
                                  height: 4,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 164,
                                          height: 4,
                                          decoration: ShapeDecoration(
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 143.86,
                                          height: 4,
                                          decoration: ShapeDecoration(
                                            color: const Color(
                                              0xFF2F7FCE,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  '12 Questions Answered',
                                  style: TextStyle(
                                    color: Color(
                                      0xFF455A64,
                                    ),
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 20.0,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: fetchQuizResults(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text(
                      'Error: ${snapshot.error}',
                    );
                  } else if (!snapshot.hasData ||
                      (snapshot.data as List<DocumentSnapshot>).isEmpty) {
                    return const Center(
                      child: Text(
                        'No quizs are available',
                      ),
                    );
                  } else {
                    List<DocumentSnapshot> quizResults =
                        snapshot.data as List<DocumentSnapshot>;
                    return Expanded(
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Your Quizs',
                                style: TextStyle(
                                  color: Color(0xFF263238),
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                              Text(
                                'View All',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF263238),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: quizResults.length > 3
                                  ? 3
                                  : quizResults.length,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> data = quizResults[index]
                                    .data() as Map<String, dynamic>;
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10.0,
                                    bottom: 10,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        FFAppState().questionOptionAnswer =
                                            data['quiz'];
                                      });
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Quiz(
                                            quizRef: data['quizRef'],
                                            topicName: data["topicName"],
                                            isMultiple: data["isMultiple"],
                                            isFromHistory: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        color: const Color(
                                          0xFFE6F2FF,
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 0,
                                            color: Color(
                                              0xFFBCDDFE,
                                            ),
                                            offset: Offset(
                                              0,
                                              4,
                                            ),
                                            spreadRadius: 0,
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(
                                          30,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 10.0,
                                          left: 15,
                                          bottom: 20,
                                          right: 15,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.timer,
                                              color: Colors.blue,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '${data['topicName']}',
                                              style: const TextStyle(
                                                color: Color(
                                                  0xFF263238,
                                                ),
                                                fontSize: 16,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${data['totalAnswerCount']} Questions Answered',
                                                  style: const TextStyle(
                                                    color: Color(0xFF2F7FCE),
                                                    fontSize: 12,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                                Text(
                                                  '${data['totalQuestion']}  Questions',
                                                  style: const TextStyle(
                                                    color: Color(0xFF455A64),
                                                    fontSize: 12,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w400,
                                                    height: 0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            LinearPercentIndicator(
                                              linearGradient:
                                                  const LinearGradient(
                                                begin: Alignment(
                                                  0.00,
                                                  -1.00,
                                                ),
                                                end: Alignment(0, 1),
                                                colors: [
                                                  Color(
                                                    0xFF4CD0C3,
                                                  ),
                                                  Color(
                                                    0xFF2F7FCE,
                                                  ),
                                                ],
                                              ),
                                              lineHeight: 12,
                                              percent:
                                                  ((data['totalAnswerCount']) /
                                                      (data['totalQuestion'])),
                                              animation: true,
                                              animateFromLastPercent: true,
                                              backgroundColor: const Color(
                                                0xFFE0E3E7,
                                              ),
                                              barRadius: const Radius.circular(
                                                24,
                                              ),
                                              padding: EdgeInsets.zero,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<List<DocumentSnapshot>> fetchQuizResults() async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('QuizResult').get();
  return querySnapshot.docs;
}
