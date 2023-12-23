dynamic customPrompt(
  bool isMultiple,
  String question,
  int? totalQuestions,
  String? typeOfAnswers,
) {
  return isMultiple
      ? [
          {
            "role": "user",
            "content":
                "Generate $totalQuestions quiz questions with $typeOfAnswers options on the topic of $question. Each question should be clear and concise. The answer should not be included in the question. Ensure that the questions cover a range of difficulty levels with an answer key."
            // "Generate the $totalQuestions question quiz with $typeOfAnswers options  based on $question with answer key"
          }
        ]
      : [
          {
            "role": "user",
            "content":
                "Generate $totalQuestions quiz questions of true and false without giving an option on the topic of $question. Each question should be clear and concise, and the answer should not be included in the question. Ensure that the questions cover a range of difficulty levels with answer key and answer should append after every question."
            // "Create a quiz with 5 questions of true and false without giving an option, along with the correct answers."
          }
        ];
}
