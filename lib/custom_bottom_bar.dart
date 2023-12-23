// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quiz/all_contest.dart';
import 'package:quiz/generate_quiz.dart';
import 'package:quiz/profile.dart';
import 'package:quiz/search.dart';

import 'home.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int pageIndex = 0;
  final pages = [
    const Home(),
    const Search(),
    const AllContest(),
    const Profile(),
    GenerateQuiz(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 90,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Material(
                  // color: Colors.transparent,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: IconButton(
                    onPressed: () async {
                      setState(() {
                        pageIndex = 0;
                      });
                    },
                    icon: Icon(
                      Icons.home_rounded,
                      size: 24,
                      color: pageIndex == 0 ? Colors.blue : Colors.black,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  icon: Icon(
                    Icons.search,
                    color: pageIndex == 1 ? Colors.blue : Colors.black,
                    size: 24,
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenerateQuiz(),
                      ),
                    );
                    // context.pushNamed('customQuiz');
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      // color: FlutterFlowTheme.of(context).primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      // color: FlutterFlowTheme.of(context).primaryBtnText,
                      size: 24,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    setState(() {
                      pageIndex = 2;
                    });
                    // _model.updatePage(() {
                    //   FFAppState().pageIndex = 2;
                    // });
                  },
                  icon: Icon(
                    Icons.library_books,
                    color: pageIndex == 2 ? Colors.blue : Colors.black,
                    size: 22,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    setState(() {
                      pageIndex = 3;
                    });
                    // _model.updatePage(() {
                    //   FFAppState().pageIndex = 3;
                    // });
                  },
                  icon: Icon(Icons.person,
                      size: 24,
                      color: pageIndex == 3 ? Colors.blue : Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
      body: pages[pageIndex],
    );
  }
}
