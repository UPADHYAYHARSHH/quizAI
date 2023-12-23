import 'package:flutter/material.dart';

class OptionTextfieldWidget extends StatefulWidget {
  const OptionTextfieldWidget({
    super.key,
    // required this.onChangeMethod,
    this.optionIndex,
    this.option,
    this.questionIndex,
  });

  // final Future<dynamic> Function()? onChangeMethod;
  final int? optionIndex;
  final String? option;
  final int? questionIndex;

  @override
  _OptionTextfieldWidgetState createState() => _OptionTextfieldWidgetState();
}

class _OptionTextfieldWidgetState extends State<OptionTextfieldWidget> {
  final TextEditingController option = TextEditingController();

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFE6F2FF),
            boxShadow: const [
              BoxShadow(
                blurRadius: 0.0,
                color: Color(0xFFBCDDFE),
                offset: Offset(0.0, 4.0),
                spreadRadius: 0.0,
              )
            ],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
            child: Form(
              // key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: TextFormField(
                controller: option,
                // focusNode: _model.textFieldFocusNode,
                // onChanged: (_) => EasyDebounce.debounce(
                //   '_model.textController',
                //   Duration(milliseconds: 2000),
                //       () async {
                //     if (_model.textController.text != null &&
                //         _model.textController.text != '') {
                //       setState(() {
                //         FFAppState().updateQuestionOptionAnswerAtIndex(
                //           widget.questionIndex!,
                //               (e) => e
                //             ..updateOptions(
                //                   (e) => e[widget.optionIndex!] =
                //                   _model.textController.text,
                //             ),
                //         );
                //       });
                //       return;
                //     } else {
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(
                //           content: Text(
                //             valueOrDefault<String>(
                //                   () {
                //                 if (FFAppState().selectedLanguage == 'English') {
                //                   return 'You must provide appropriate corresponding option for above question..';
                //                 } else if (FFAppState().selectedLanguage ==
                //                     'Spanish') {
                //                   return 'Debe proporcionar la opción correspondiente apropiada para la pregunta anterior.';
                //                 } else {
                //                   return 'È necessario fornire l\'opzione corrispondente appropriata per la domanda precedente.';
                //                 }
                //               }(),
                //               'You must provide appropriate corresponding option for above question..',
                //             ),
                //             style: TextStyle(
                //               fontFamily: 'Inter',
                //               color:
                //               FlutterFlowTheme.of(context).primaryBackground,
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
                textAlign: TextAlign.center,
                maxLines: null,
                minLines: 1,
                // validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
