import 'package:covidapp/constants.dart';
import 'package:covidapp/widgets/InputField.dart';
import 'package:flutter/material.dart';

class Social_Distance extends StatelessWidget {
  const Social_Distance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController space = TextEditingController();
    final TextEditingController floor_Space = TextEditingController();

    var square_Space = int.parse(space.text);
    var floor = int.parse(floor_Space.text);

    double floar_Persent = floor / 100;

    double quos = 1 - floar_Persent;

    double quoss = square_Space * quos;

    double quosss = quoss / 144;

    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kMainColor,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          title: Text('Social Ditance'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Spacer(
                flex: 2,
              ),
              Input_Text_number(
                  title: "Squre Space", icon: Icons.square_foot, ctr: space),
              Input_Text_number(
                  title: "Floor Space",
                  icon: Icons.square_foot,
                  ctr: floor_Space),
              SizedBox(
                height: kDefaultPadding * 4,
              ),
              Container(
                  width: double.infinity,
                  height: 60.0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: ElevatedButton(
                          onPressed: () {
                            ;
                          },
                          child: Text(
                            'Calculate',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          )))),
              Container(
                width: double.infinity,
                height: 50,
                child: Column(
                  children: [
                    Text('Number of people is :'),
                    Text("${quosss}"),
                  ],
                ),
              ),
              Spacer(
                flex: 4,
              ),
            ],
          ),
        ));
  }
}
