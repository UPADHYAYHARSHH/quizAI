import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz/app_state.dart';
import 'package:quiz/custom_bottom_bar.dart';

class QuizResult extends StatefulWidget {
  const QuizResult({
    super.key,
    this.totalTime,
    this.totalQuestion,
    this.correctAnswer,
    this.attendedQueston,
  });

  final String? totalTime;
  final int? totalQuestion;
  final int? correctAnswer;
  final double? attendedQueston;

  @override
  State<QuizResult> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16,
            top: 15,
          ),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Result',
                        style: TextStyle(
                          color: Color(0xFF263238),
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CircularPercentIndicator(
                      center: Text(
                        '${widget.correctAnswer! * 10} %',
                        style: const TextStyle(
                          fontSize: 22,
                        ),
                      ),
                      lineWidth: 8,
                      radius: 80,
                      percent: (widget.correctAnswer!.toDouble() / 10),
                      linearGradient: const LinearGradient(
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
                      backgroundColor: const Color(
                        0xFFE0E3E7,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6F2FF),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 0,
                            color: Color(0xFFBCDDFE),
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 30.0,
                          bottom: 20,
                        ),
                        child: Column(
                          children: [
                            const Center(
                              child: Text(
                                'Time taken',
                                style: TextStyle(
                                  color: Color(0xFF263238),
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              '03 min 02 sec',
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 16.0,
                                        left: 16,
                                        right: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                20,
                                              ),
                                              color: Colors.blue,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${widget.attendedQueston! * 100} %',
                                            style: const TextStyle(
                                              fontFamily: "Inter",
                                              color: Colors.blue,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      'Completion',
                                      style: TextStyle(
                                        color: Color(0xFF5F5F5F),
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 16.0,
                                        left: 16,
                                        right: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                20,
                                              ),
                                              color: Colors.blue,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${FFAppState().questionOptionAnswer.length}',
                                            style: const TextStyle(
                                              fontFamily: "Inter",
                                              color: Colors.blue,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      'Questions',
                                      style: TextStyle(
                                        color: Color(0xFF5F5F5F),
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 16.0,
                                        left: 16,
                                        right: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                20,
                                              ),
                                              color: Colors.green,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${widget.correctAnswer!} ',
                                            style: const TextStyle(
                                              fontFamily: "Inter",
                                              color: Colors.blue,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      'Correct',
                                      style: TextStyle(
                                        color: Color(0xFF5F5F5F),
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 16.0,
                                        left: 16,
                                        right: 16,
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                20,
                                              ),
                                              color: Colors.red,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${(FFAppState().questionOptionAnswer.length - widget.correctAnswer!)}',
                                            style: const TextStyle(
                                              fontFamily: "Inter",
                                              color: Colors.blue,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Text(
                                      'Wrong',
                                      style: TextStyle(
                                        color: Color(0xFF5F5F5F),
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomBottomBar(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6F2FF),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 0,
                          color: Color(0xFFBCDDFE),
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        'Back to Home',
                        style: TextStyle(
                          color: Color(0xFF2F7FCE),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
