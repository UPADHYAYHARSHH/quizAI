import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz/actions/map_question_answer.dart';
import 'package:quiz/app_state.dart';
import 'package:quiz/firebase.dart';
import 'package:quiz/questionOptionStructure.dart';
import 'package:quiz/quiz.dart';

import 'actions/formatQuestionOption.dart';
import 'components/custom_button.dart';

class GenerateQuiz extends StatefulWidget {
  const GenerateQuiz({super.key});

  @override
  State<GenerateQuiz> createState() => _GenerateQuizState();
}

class _GenerateQuizState extends State<GenerateQuiz> {
  bool loading = false;
  final TextEditingController _topic = TextEditingController();
  static const List<String> list = <String>[
    '4 options',
    '2 options',
  ];
  static const List<String> list2 = <String>[
    '10',
    '15',
    '5',
  ];
  String typeOfAnswer = list.first;
  String noOfQuestion = list2.first;

  @override
  void initState() {
    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 15,
            right: 16,
            bottom: 20,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Image.asset(
                              'asset/images/close.png',
                            ),
                          ),
                          const Text(
                            'Create a new quiz',
                            style: TextStyle(
                              color: Color(0xFF263238),
                              fontSize: 24,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          Container(),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        cursorColor: Colors.blue,
                        textInputAction: TextInputAction.newline,
                        controller: _topic,
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'Please enter any topic';
                          }
                          return null;
                        },
                        obscureText: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFEDEEF1),
                          hintText: 'Enter Text',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        maxLines: 5,
                        minLines: 1,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Type of answer',
                          style: TextStyle(
                            color: Color(0xFF455A64),
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
                      DropdownMenu(
                        menuStyle: const MenuStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Colors.white,
                          ),
                          shadowColor: MaterialStatePropertyAll(
                            Colors.white,
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.9,
                        initialSelection: list.first,
                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            typeOfAnswer = value!;
                          });
                        },
                        dropdownMenuEntries:
                            list.map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Number of questions',
                          style: TextStyle(
                            color: Color(0xFF455A64),
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
                      DropdownMenu(
                        menuStyle: const MenuStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Colors.white,
                          ),
                          shadowColor: MaterialStatePropertyAll(
                            Colors.white,
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.9,
                        initialSelection: list2.first,
                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            noOfQuestion = value!;
                          });
                        },
                        dropdownMenuEntries: list2
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      apiCall();
                    }
                  },
                  child: CustomButton(
                    buttonText: 'Generate Quiz',
                    loading: loading,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  dynamic apiCall() async {
    setState(() {
      loading = true;
    });
    var response = await http.post(
        Uri.parse(
          'https://api.openai.com/v1/chat/completions',
        ),
        headers: {
          "Authorization":
              "Bearer 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",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": typeOfAnswer == '4 options'
              ? [
                  {
                    "role": "user",
                    "content":
                        'Generate $noOfQuestion quiz questions with $typeOfAnswer options options on the topic of ${_topic.text}. Each question should be clear and concise. The answer should not be included in the question. Ensure that the questions cover a range of difficulty levels with an answer key and answer should be append after each completed question.',
                  }
                ]
              : [
                  {
                    "role": "user",
                    "content":
                        'Generate $noOfQuestion quiz questions of true and false without giving an option on the topic of ${_topic.text}. Each question should be clear and concise, and the answer should not be included in the question. Ensure that the questions cover a range of difficulty levels with answer key and answer should append after every question.',
                  }
                ]
        }));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List<String> question = await formatQuestionOption(
          typeOfAnswer == '4 options' ? true : false,
          json["choices"][0]["message"]["content"].toString(),
          'question');
      List<String> option = await formatQuestionOption(
          typeOfAnswer == '4 options' ? true : false,
          json["choices"][0]["message"]["content"].toString(),
          'option');
      List<String> answer = await formatQuestionOption(
          typeOfAnswer == '4 options' ? true : false,
          json["choices"][0]["message"]["content"].toString(),
          'answer');
      setState(() {
        loading = false;
      });
      List<QuestionOptionStructure> mergeQuiz = await mapQuestionAnswer(
        question.toList(),
        option.toList(),
        answer.toList(),
        typeOfAnswer == '4 options' ? true : false,
      );
      FFAppState().questionOptionAnswer =
          mergeQuiz.toList().cast<QuestionOptionStructure>();
      await quiz(
        getCurrentUser(),
        noOfQuestion,
        _topic.text,
        false,
        DateTime.now(),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Quiz(
              quizRef: FirebaseFirestore.instance.collection('quiz').doc(),
              topicName: _topic.text),
        ),
      );
    } else {
      print('harsh--->${response.body.toString()}');
      setState(() {
        loading = false;
      });
    }
  }
}
