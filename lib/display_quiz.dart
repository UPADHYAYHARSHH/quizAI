import 'package:flutter/material.dart';
import 'package:quiz/app_state.dart';
import 'package:quiz/components/quiz_component.dart';
import 'package:quiz/questionOptionStructure.dart';

class DisplayQuiz extends StatefulWidget {
  const DisplayQuiz({
    super.key,
  });

  @override
  State<DisplayQuiz> createState() => _DisplayQuizState();
}

class _DisplayQuizState extends State<DisplayQuiz> {
  List<QuestionOptionStructure> quizData2 = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Builder(builder: (context) {
              List<QuestionOptionStructure> quizList =
                  FFAppState().questionOptionAnswer;
              return SingleChildScrollView(
                child: Column(
                    children: List.generate(quizList.length, (quizListIndex) {
                  final quizListItem = quizList[quizListIndex];
                  return QuizComponentWidget(
                      question: quizListItem.question,
                      options: quizListItem.option,
                      answer: quizListItem.answer,
                      questionAnswerIndex: quizListIndex);
                })),
              );
            })
          ],
        ),
      ),
    );
  }
}
