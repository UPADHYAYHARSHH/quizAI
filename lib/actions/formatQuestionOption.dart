Future<List<String>> formatQuestionOption(
  bool isMultiple,
  String apiResponse,
  String dataReturnType,
) async {
  if (isMultiple) {
    List<String> extractedQuestions = [];
    if (dataReturnType == 'question') {
      List<String> questionsList = apiResponse.split('\n');

      for (String line in questionsList) {
        if (line.isNotEmpty &&
            !line.startsWith('a)') &&
            !line.startsWith('b)') &&
            !line.startsWith('c)') &&
            !line.startsWith('d)') &&
            !line.startsWith('Answer')) {
          extractedQuestions.add(line.trim());
        }
      }
    } else if (dataReturnType == 'option') {
      List<String> questionList = apiResponse.split('\n');

      for (String line in questionList) {
        line = line.trim();
        if (line.isNotEmpty &&
            (line.startsWith('a)') ||
                line.startsWith('b)') ||
                line.startsWith('c)') ||
                line.startsWith('d)'))) {
          extractedQuestions.add(line);
        }
        if (line.endsWith('1.')) {
          line.trim();
          extractedQuestions.add(line);
        }
      }
    } else if (dataReturnType == 'answer') {
      // TODO SET ANSWER
      List<String> questionList = apiResponse.split('\n');
      for (String line in questionList) {
        line = line.trim();
        if (line.isNotEmpty && (line.startsWith('Answer'))) {
          if (line.contains('Answer:')) {
            line = (line.replaceRange(line.indexOf('Answer:'), line.length,
                line.substring(line.indexOf('Answer:') + 8)));
          }
          extractedQuestions.add(line);
        }
      }
    }
    return extractedQuestions;
  }
  // Add your function code here!
  else {
    List<String> extractedQuestions = [];
    if (dataReturnType == 'question') {
      List<String> questionsList = apiResponse.split('\n');

      for (String line in questionsList) {
        if (line.isNotEmpty &&
            !line.startsWith('a)') &&
            !line.startsWith('b)') &&
            !line.startsWith('c)') &&
            !line.startsWith('d)') &&
            !line.startsWith('Answer')) {
          extractedQuestions.add(line.trim());
        }
      }
    } else if (dataReturnType == 'answer') {
      // TODO SET ANSWER
      List<String> questionList = apiResponse.split('\n');
      for (String line in questionList) {
        line = line.trim();
        if (line.isNotEmpty && (line.startsWith('Answer'))) {
          if (line.contains('Answer:')) {
            line = (line.replaceRange(line.indexOf('Answer:'), line.length,
                line.substring(line.indexOf('Answer:') + 8)));
          }
          extractedQuestions.add(line);
        }
      }
    }
    return extractedQuestions;
  }
}
