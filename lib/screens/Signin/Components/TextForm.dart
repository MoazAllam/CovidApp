import 'package:covidapp/screens/HomePage/HomePage_noninficted/HomePage.dart';
import 'package:covidapp/screens/Signup/SignupPage.dart';
import 'package:covidapp/widgets/InputField.dart';
import 'package:covidapp/widgets/RoundedButton.dart';
import 'package:covidapp/widgets/TextUnderButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Signin_TextForm extends StatelessWidget {
  const Signin_TextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailcontroller = TextEditingController();
    final TextEditingController _passwordcontroller = TextEditingController();

    GlobalKey<FormState> forkey = GlobalKey<FormState>();

    return Form(
      key: forkey,
      child: Column(
        children: [
          Input_Text(
            title: "Email",
            subtitle: "",
            icon: FontAwesomeIcons.envelope,
            ctr: _emailcontroller,
            isPassword: false,
          ),
          Input_Text(
            title: "Password",
            subtitle: "",
            icon: Icons.lock_outlined,
            isPassword: true,
            ctr: _passwordcontroller,
          ),
          SizedBox(height: 50.0,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: RoundedButton(
                  title: "Signin",
                ),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage_noninficted())),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                child: Text_Under_RoundedButton(
                  quistion: "Do not have an account?",
                  order: " Signup",
                ),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupPage())),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
