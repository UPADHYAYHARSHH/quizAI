import 'package:flutter/material.dart';
import 'package:quiz/components/option_textfield.dart';

class QuizComponentWidget extends StatefulWidget {
  const QuizComponentWidget({
    super.key,
    this.question,
    this.options,
    this.answer,
    this.questionAnswerIndex,
    // required this.onChangeMethod,
  });

  final String? question;
  final List<String>? options;
  final String? answer;
  final int? questionAnswerIndex;

  // final Future<dynamic> Function()? onChangeMethod;

  @override
  _QuizComponentWidgetState createState() => _QuizComponentWidgetState();
}

class _QuizComponentWidgetState extends State<QuizComponentWidget> {
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2.0,
                    color: Color(0x33000000),
                    offset: Offset(0.0, 2.0),
                  )
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                child: TextFormField(
                  // controller: _model.textController1,
                  // focusNode: _model.textFieldFocusNode1,
                  // onChanged: (_) => EasyDebounce.debounce(
                  //   '_model.textController1',
                  //   Duration(milliseconds: 2000),
                  //   () async {
                  //     if (_model.textController1.text != null &&
                  //         _model.textController1.text != '') {
                  //       setState(() {
                  //         FFAppState().updateQuestionOptionAnswerAtIndex(
                  //           widget.questionAnswerIndex!,
                  //           (e) => e..questions = _model.textController1.text,
                  //         );
                  //       });
                  //       return;
                  //     } else {
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           content: Text(
                  //             valueOrDefault<String>(
                  //               () {
                  //                 if (FFAppState().selectedLanguage == 'English') {
                  //                   return 'Question should not be empty.';
                  //                 } else if (FFAppState().selectedLanguage ==
                  //                     'Spanish') {
                  //                   return 'La pregunta no debe estar vacía.';
                  //                 } else {
                  //                   return 'La domanda non dovrebbe essere vuota.';
                  //                 }
                  //               }(),
                  //               'Question should not be empty.',
                  //             ),
                  //             style: TextStyle(
                  //               fontFamily: 'Inter',
                  //               color:
                  //                   FlutterFlowTheme.of(context).primaryBackground,
                  //               fontSize: 14.0,
                  //             ),
                  //           ),
                  //           duration: Duration(milliseconds: 5000),
                  //           backgroundColor: FlutterFlowTheme.of(context).error,
                  //         ),
                  //       );
                  //       return;
                  //     }
                  //   },
                  // ),
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  // readOnly: FFAppState().isEdit == false,
                  obscureText: false,
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),

                  maxLines: null,
                  minLines: 1,
                  cursorColor: Colors.blue,
                  // validator: _model.textController1Validator.asValidator(context),
                ),
              ),
            ),
            Builder(
              builder: (context) {
                final options = widget.options!.toList();
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(options.length, (optionsIndex) {
                    final optionsItem = options[optionsIndex];
                    return OptionTextfieldWidget(
                      key: Key('Keyurc_${optionsIndex}_of_${options.length}'),
                      optionIndex: optionsIndex,
                      option: optionsItem,
                      questionIndex: widget.questionAnswerIndex!,
                    );
                  }),
                );
              },
            ),
            const Align(
              alignment: AlignmentDirectional(-1.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: Text(
                  'answer',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 30.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 0.0,
                      color: Color(0xFF235F9A),
                      offset: Offset(0.0, 4.0),
                      spreadRadius: 0.0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      10.0, 0.0, 10.0, 0.0),
                  child: TextFormField(
                    // controller: _model.textController2,
                    // focusNode: _model.textFieldFocusNode2,
                    // onChanged: (_) => EasyDebounce.debounce(
                    //   '_model.textController2',
                    //   Duration(milliseconds: 2000),
                    //   () async {
                    //     if (_model.textController2.text != null &&
                    //         _model.textController2.text != '') {
                    //       setState(() {
                    //         FFAppState().updateQuestionOptionAnswerAtIndex(
                    //           widget.questionAnswerIndex!,
                    //           (e) => e..answers = _model.textController2.text,
                    //         );
                    //       });
                    //       return;
                    //     } else {
                    //       ScaffoldMessenger.of(context).showSnackBar(
                    //         SnackBar(
                    //           content: Text(
                    //             valueOrDefault<String>(
                    //               () {
                    //                 if (FFAppState().selectedLanguage ==
                    //                     'English') {
                    //                   return 'The answer should be realevent to corresponding above question and should not be empty.';
                    //                 } else if (FFAppState().selectedLanguage ==
                    //                     'Spanish') {
                    //                   return 'La respuesta debe ser un evento real a la pregunta anterior correspondiente y no debe estar vacía.';
                    //                 } else {
                    //                   return 'La risposta dovrebbe essere reale rispetto alla domanda precedente corrispondente e non dovrebbe essere vuota.';
                    //                 }
                    //               }(),
                    //               'The answer should be realevent to corresponding above question and should not be empty.',
                    //             ),
                    //             style: TextStyle(
                    //               fontFamily: 'Inter',
                    //               color: FlutterFlowTheme.of(context)
                    //                   .primaryBackground,
                    //               fontSize: 14.0,
                    //             ),
                    //           ),
                    //           duration: Duration(milliseconds: 5000),
                    //           backgroundColor: FlutterFlowTheme.of(context).error,
                    //         ),
                    //       );
                    //       return;
                    //     }
                    //   },
                    // ),
                    // readOnly: FFAppState().isEdit == false,
                    obscureText: false,
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),

                    maxLines: null,
                    minLines: 1,
                    // validator: _model.textController2Validator.asValidator(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
