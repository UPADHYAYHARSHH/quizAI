import 'package:quiz/questionOptionStructure.dart';

Future<List<QuestionOptionStructure>> mapQuestionAnswer(List<String> questions,
    List<String> options, List<String> answers, bool isMultiple) async {
  List<QuestionOptionStructure> data = [];
  if (isMultiple) {
    int r = 0;
    int length = (options.length / questions.length).floor();
    for (int i = 0; i < questions.length; i++) {
      data.add(
        QuestionOptionStructure(
          question: questions[i],
          option: (i < questions.length)
              ? getOptionsFromData(
                  r,
                  options,
                  length,
                )
              : [],
          answer: answers[i],
        ),
      );
      r += length;
    }

    return data;
  } else {
    int r = 0;
    int length = questions.length;
    for (int i = 0; i < questions.length; i++) {
      data.add(
        QuestionOptionStructure(
          question: questions[i],
          answer: answers[i],
        ),
      );
      r += length;
    }
    return data;
  }
}

List<String> getOptionsFromData(
    int optionsIndex, List<String> options, int length) {
  List<String> option = [];
  for (int j = 0; j < length; j++) {
    option.add(options[optionsIndex + j].toString());
  }
  return option;
}
