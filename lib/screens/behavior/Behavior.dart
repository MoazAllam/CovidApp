import 'package:covidapp/constants.dart';
import 'package:covidapp/widgets/RoundedButton.dart';
import 'package:flutter/material.dart';

class Behavior_Page extends StatelessWidget {
  final String behavior;
  final IconData icon;
  final Color color;
  final MaterialPageRoute page;

  const Behavior_Page(
      {Key? key,
      required this.behavior,
      required this.icon,
      required this.color, 
      required this.page,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Icon(
                icon,
                size: 200.0,
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            Column(
              children: [
                Text(
                  "You are",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.black, fontSize: 40.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  behavior,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: color, fontSize: 40.0),
                ),
              ],
            ),
            SizedBox(height: 40.0,),
            GestureDetector(
              onTap: () => Navigator.push(context, page),
              child: RoundedButton(
                title: "Next",
              ),
            )
          ],
        ),
      ),
    );
  }
}
