import 'dart:developer';

import 'package:codeEditor/Utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:highlight/highlight.dart';
import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/cpp.dart';
import 'package:highlight/languages/python.dart';
import 'package:highlight/languages/cs.dart';
import 'package:highlight/languages/1c.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_highlight/themes/androidstudio.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:flutter_highlight/themes/atom-one-light.dart';
import 'package:flutter_highlight/themes/dark.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_highlight/themes/night-owl.dart';
import 'package:flutter_highlight/themes/ocean.dart';
import 'package:flutter_highlight/themes/vs.dart';

class EditorPage extends StatefulWidget {
  const EditorPage({super.key});

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  late CodeController _codeController;

  String text = 'int main(){}';
  Mode lang = cpp;
  Map<String, TextStyle> currTheme = monokaiSublimeTheme;

  List<String> themes = [
    'Android Studio',
    'Monokai Sublime',
    'Atom One Dark',
    'Atom One Light',
    'Github',
    'Ocean',
    'Visual Studio'
  ];
  List<String> langs = ['C++', 'Python', 'Dart', 'C#', 'C'];

  langSetter(String language) {
    switch (language) {
      case 'C++':
        lang = cpp;
        break;
      case 'Python':
        lang = python;
        break;
      case 'Dart':
        lang = dart;
        break;
      case 'C#++':
        lang = cs;
        break;
      case 'C':
        lang = lang1C;
        break;
      default:
    }
    setState(() {});
  }

  themeSetter(String theme) {
    switch (theme) {
      case 'Android Studio':
        currTheme = androidstudioTheme;
        setState(() {});
        break;
      case 'Monokai Sublime':
        currTheme = monokaiSublimeTheme;
        setState(() {});
        break;
      case 'Atom One Dark':
        currTheme = atomOneDarkTheme;
        setState(() {});
        break;
      case 'Atom One Light':
        currTheme = atomOneLightTheme;
        setState(() {});
        break;
      case 'Github':
        currTheme = githubTheme;
        setState(() {});
        break;
      case 'Ocean':
        currTheme = oceanTheme;
        setState(() {});
        break;
      case 'Visual Studio':
        currTheme = vsTheme;
        setState(() {});
        break;
      default:
        currTheme = atomOneLightTheme;
        setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _codeController = CodeController(
      text: text,
      language: lang,
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            height: height / 25,
            width: width,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.grey[300]),
            child: Row(
              children: [
                Text(
                  '</> Code',
                  style: AppTypography.subTitles.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                const Expanded(child: SizedBox()),
                DropdownButton<String>(
                  icon: const Icon(Icons.palette),
                  items: themes.map((e) {
                    return DropdownMenuItem<String>(
                        onTap: () => themeSetter(e), value: e, child: Text(e));
                  }).toList(),
                  onChanged: (value) {},
                ),
                DropdownButton<String>(
                  icon: const Icon(Icons.code),
                  items: langs.map((e) {
                    return DropdownMenuItem<String>(
                        onTap: () => langSetter(e), value: e, child: Text(e));
                  }).toList(),
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          //code editor
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: SizedBox(
              height: height / 1.5,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CodeField(
                        onChanged: (value) {
                          text = value;
                          setState(() {});
                        },
                        cursorColor: Colors.purple[300],
                        controller: _codeController),
                  ],
                ),
              ),
            ),
          ),

          //submit button
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
              onPressed: () {
                //submit functionality
              },
              child: Text(
                'Submit',
                style: AppTypography.primaryStyle
                    .copyWith(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
