import 'package:covidapp/screens/FormPage/FormPage.dart';
import 'package:covidapp/screens/Signin/SigninPage.dart';
import 'package:covidapp/widgets/InputField.dart';
import 'package:covidapp/widgets/RoundedButton.dart';
import 'package:covidapp/widgets/TextUnderButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextForm extends StatefulWidget {
  const TextForm({Key? key}) : super(key: key);

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _usercontroller = TextEditingController();
    final TextEditingController _emailcontroller = TextEditingController();
    final TextEditingController _passwordcontroller = TextEditingController();

    GlobalKey<FormState> forkey = GlobalKey<FormState>();

    // CollectionReference users = FirebaseFirestore.instance.collection('Users');

    return Form(
      key: forkey,
      child: Column(
        children: [
          Input_Text(
            title: "Username",
            subtitle: "moaz allam",
            icon: FontAwesomeIcons.user,
            isPassword: false,
            ctr: _usercontroller,
          ),
          Input_Text(
            title: "Email",
            subtitle: "user@domain.com",
            icon: FontAwesomeIcons.envelope,
            ctr: _emailcontroller,
            isPassword: false,
          ),
          Input_Text(
            title: "Password",
            subtitle: "make a strong Password",
            icon: Icons.lock_outlined,
            isPassword: true,
            ctr: _passwordcontroller,
          ),
          SizedBox(
            height: 40.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if(forkey.currentState!.validate()){
                    print('Form was submited');
                    // users.add({
                      // 'userName' : _usercontroller,
                    // });
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FormPage()));
                  }
                },
                child: RoundedButton(
                  title: "Next",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SigninPage()));
                },
                child: Text_Under_RoundedButton(
                  quistion: "Are You alreardy have an acount?",
                  order: " Signin",
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
