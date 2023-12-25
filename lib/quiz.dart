import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quiz/app_state.dart';
import 'package:quiz/questionOptionStructure.dart';
import 'package:quiz/utils/quiz_result.dart';

import 'firebase.dart';

class Quiz extends StatefulWidget {
  const Quiz(
      {super.key,
      required this.quizRef,
      required this.topicName,
      required this.isMultiple,
      required this.isFromHistory});

  final DocumentReference quizRef;
  final String topicName;
  final bool isMultiple;
  final bool isFromHistory;

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  QuestionOptionStructure? singleQuizResponse;
  String? selectedOption = '';
  bool isSelectOption = false;

  List<String> selectedOptions = [];
  int correctAnswerCount = 0;
  int questionIndex = 0;
  DateTime? startTime;
  int totalAttendedOption = 0;
  DateTime? endTime;

  @override
  void initState() {
    super.initState();
    setState(() {
      singleQuizResponse = FFAppState().questionOptionAnswer[0];
      startTime = DateTime.now();
    });
  }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${(questionIndex + 1).toString()}/${FFAppState().questionOptionAnswer.length.toString()}',
                  ),
                  const Text(
                    'Quiz',
                    style: TextStyle(
                      color: Color(
                        0xFF263238,
                      ),
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  const Icon(
                    Icons.add,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              LinearPercentIndicator(
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
                lineHeight: 12,
                percent: ((questionIndex + 1) /
                    FFAppState().questionOptionAnswer.length),
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
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  singleQuizResponse!.question!,
                  style: const TextStyle(
                    color: Color(0xFF263238),
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              if (widget.isMultiple)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Builder(
                      builder: (context) {
                        final option =
                            singleQuizResponse?.option?.toList() ?? [];
                        return ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: option.length,
                          itemBuilder: (context, optionIndex) {
                            final optionItem = option[optionIndex];
                            return Padding(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 10,
                              ),
                              child: InkWell(
                                onTap: () {
                                  if (!isSelectOption) {
                                    setState(
                                      () {
                                        selectedOption = optionItem;
                                        selectedOptions.add(optionItem);
                                        isSelectOption = true;
                                        totalAttendedOption =
                                            totalAttendedOption + 1;
                                        if (selectedOption == optionItem &&
                                            selectedOption ==
                                                singleQuizResponse!.answer) {
                                          setState(() {
                                            correctAnswerCount =
                                                (correctAnswerCount + 1);
                                          });
                                        }
                                      },
                                    );
                                  } else {
                                    return;
                                  }
                                },
                                child: Container(
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    color: () {
                                      if (selectedOption == optionItem &&
                                          selectedOption ==
                                              singleQuizResponse!.answer) {
                                        return Colors.green;
                                      } else if (selectedOption == optionItem &&
                                          selectedOption !=
                                              singleQuizResponse!.answer) {
                                        return Colors.red;
                                      } else {
                                        return const Color(0xFFE6F2FF);
                                      }
                                    }(),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0,
                                        color: () {
                                          if (selectedOption == optionItem &&
                                              selectedOption ==
                                                  singleQuizResponse!.answer) {
                                            return Colors.green.shade300;
                                          } else if (selectedOption ==
                                                  optionItem &&
                                              selectedOption !=
                                                  singleQuizResponse!.answer) {
                                            return Colors.red.shade300;
                                          } else {
                                            return const Color(0xFFBCDDFE);
                                          }
                                        }(),
                                        offset: const Offset(0, 4),
                                        spreadRadius: 0,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20.0,
                                        bottom: 20,
                                        left: 10,
                                      ),
                                      child: Text(
                                        optionItem,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              if (widget.isMultiple == false)
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            bottom: 10,
                          ),
                          child: InkWell(
                            onTap: () {
                              if (!isSelectOption) {
                                setState(
                                  () {
                                    selectedOption = "true";
                                    selectedOptions.add("true");
                                    isSelectOption = true;
                                    totalAttendedOption =
                                        totalAttendedOption + 1;
                                    if (selectedOption == "true" &&
                                        selectedOption ==
                                            singleQuizResponse!.answer) {
                                      setState(() {
                                        correctAnswerCount =
                                            (correctAnswerCount + 1);
                                      });
                                    }
                                  },
                                );
                              } else {
                                return;
                              }
                            },
                            child: Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: () {
                                  if (selectedOption == "true" &&
                                      selectedOption ==
                                          singleQuizResponse!.answer) {
                                    return Colors.green;
                                  } else if (selectedOption == "true" &&
                                      selectedOption !=
                                          singleQuizResponse!.answer) {
                                    return Colors.red;
                                  } else {
                                    return const Color(0xFFE6F2FF);
                                  }
                                }(),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 0,
                                    color: () {
                                      if (selectedOption == "true" &&
                                          selectedOption ==
                                              singleQuizResponse!.answer) {
                                        return Colors.green.shade300;
                                      } else if (selectedOption == "true" &&
                                          selectedOption !=
                                              singleQuizResponse!.answer) {
                                        return Colors.red.shade300;
                                      } else {
                                        return const Color(0xFFBCDDFE);
                                      }
                                    }(),
                                    offset: const Offset(0, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 20.0,
                                    bottom: 20,
                                    left: 10,
                                  ),
                                  child: Text(
                                    "true",
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            bottom: 10,
                          ),
                          child: InkWell(
                            onTap: () {
                              if (!isSelectOption) {
                                setState(
                                  () {
                                    selectedOption = "false";
                                    selectedOptions.add("false");
                                    isSelectOption = true;
                                    totalAttendedOption =
                                        totalAttendedOption + 1;
                                    if (selectedOption == "false" &&
                                        selectedOption ==
                                            singleQuizResponse!.answer) {
                                      setState(() {
                                        correctAnswerCount =
                                            (correctAnswerCount + 1);
                                      });
                                    }
                                  },
                                );
                              } else {
                                return;
                              }
                            },
                            child: Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: () {
                                  if (selectedOption == "false" &&
                                      selectedOption ==
                                          singleQuizResponse!.answer) {
                                    return Colors.green;
                                  } else if (selectedOption == "false" &&
                                      selectedOption !=
                                          singleQuizResponse!.answer) {
                                    return Colors.red;
                                  } else {
                                    return const Color(0xFFE6F2FF);
                                  }
                                }(),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 0,
                                    color: () {
                                      if (selectedOption == "false" &&
                                          selectedOption ==
                                              singleQuizResponse!.answer) {
                                        return Colors.green.shade300;
                                      } else if (selectedOption == "false" &&
                                          selectedOption !=
                                              singleQuizResponse!.answer) {
                                        return Colors.red.shade300;
                                      } else {
                                        return const Color(0xFFBCDDFE);
                                      }
                                    }(),
                                    offset: const Offset(0, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 20.0,
                                    bottom: 20,
                                    left: 10,
                                  ),
                                  child: Text(
                                    "false",
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: InkWell(
                  onTap: () async {
                    setState(() {
                      isSelectOption = false;
                      selectedOption = null;
                    });
                    if (questionIndex <
                        ((FFAppState().questionOptionAnswer.length) - 1)) {
                      setState(() {
                        questionIndex = questionIndex + 1;
                        singleQuizResponse =
                            FFAppState().questionOptionAnswer[questionIndex];
                      });
                    } else {
                      endTime = DateTime.now();
                      await PlayedQuiz(
                        getCurrentUser(),
                        widget.quizRef,
                        selectedOptions,
                        correctAnswerCount,
                        totalAttendedOption,
                        widget.topicName,
                        DateTime.now(),
                        FFAppState().questionOptionAnswer.length.toInt(),
                        false,
                        true,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizResult(
                            correctAnswer: correctAnswerCount,
                            attendedQueston: totalAttendedOption /
                                FFAppState().questionOptionAnswer.length,
                            totalQuestion: FFAppState()
                                .questionOptionAnswer
                                .length
                                .toInt(),
                            // totalTime: (endTime! - startTime!).toString(),
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2F7FCE),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 0,
                          color: Color(0xFF235F9A),
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        questionIndex <
                                (FFAppState().questionOptionAnswer.length - 1)
                            ? 'Next'
                            : 'Done',
                        style: const TextStyle(
                          color: Colors.white,
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
