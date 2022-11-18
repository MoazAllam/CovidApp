// import 'dart:convert';
import 'package:covidapp/constants.dart';
import 'package:covidapp/screens/HomePage/HomePage_nficted/HomePage.dart';
import 'package:covidapp/screens/HomePage/HomePage_noninficted/HomePage.dart';
import 'package:covidapp/screens/behavior/Behavior.dart';
import 'package:covidapp/widgets/InputField.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart';
// import 'package:http/http.dart' as http;

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  int crruntStep = 0;

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController age = TextEditingController();
  final TextEditingController sex = TextEditingController();
  final TextEditingController smell = TextEditingController();
  final TextEditingController cough = TextEditingController();
  final TextEditingController fatuige = TextEditingController();
  final TextEditingController skipped_meals = TextEditingController();

  void getAnswer() {
    if (_key.currentState!.validate()) {
      double answer = -1.32 -
        (0.01 * int.parse(age.text)) +
        (0.44 * int.parse(sex.text)) +
        (1.75 * int.parse(smell.text)) +
        (0.31 * int.parse(cough.text)) +
        (0.49 * int.parse(fatuige.text)) +
        (0.39 * int.parse(skipped_meals.text));
      if (answer >= 0.5) {
        print("You are confirmed");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Behavior_Page(
              behavior: "Inficted",
              icon: FontAwesomeIcons.sadCry,
              color: Colors.red,
              page: MaterialPageRoute(builder: (context) => HomePage_inficted()),
            )));
      } else {
        print("You are not confirmed");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Behavior_Page(
              behavior: "Non Inficted",
              icon: FontAwesomeIcons.smile,
              color: kMainColor,
              page: MaterialPageRoute(builder: (context) => HomePage_noninficted()),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kMainColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'More Information',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Theme(
        data: Theme.of(context)
            .copyWith(colorScheme: ColorScheme.light(primary: kMainColor)),
        child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding * 2),
            child: SingleChildScrollView(
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    Input_Text_number(
                        title: "Age", icon: Icons.question_answer, ctr: age),
                    Input_Text_number(
                        title: "Sex", icon: Icons.question_answer, ctr: sex),
                    Input_Text_number(
                        title: "Loss of smell",
                        icon: Icons.question_answer,
                        ctr: smell),
                    Input_Text_number(
                        title: "Has cough",
                        icon: Icons.question_answer,
                        ctr: cough),
                    Input_Text_number(
                        title: "Has sever fatuige",
                        icon: Icons.question_answer,
                        ctr: fatuige),
                    Input_Text_number(
                        title: "Skipped meals",
                        icon: Icons.question_answer,
                        ctr: skipped_meals),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200.0),
                        ),
                        child: ElevatedButton(
                            onPressed: () {
                              getAnswer();
                            },
                            child: Text('Complete')))
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
