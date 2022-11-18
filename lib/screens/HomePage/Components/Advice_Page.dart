import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../constants.dart';

class Advice_Page extends StatelessWidget {
  const Advice_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            elevation: 0,
            backgroundColor: Colors.red,
            // onPressed: () async {
            //   await FlutterPhoneDirectCaller.callNumber('123');
            // },
            onPressed: () {},
            label: Row(
              children: [
                Icon(Icons.call),
                SizedBox(
                  width: 20.0,
                ),
                Text('Call Hospital'),
              ],
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: kDefaultPadding),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: kMainColor,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Text(
                  'Limit contact with people who don’t live in your household as much as possible.',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 27),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                child: Preventions1(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                child: Preventions2(),
              ),
              Spacer(),
            ],
          ),
        ));
  }
}

class Preventions1 extends StatelessWidget {
  const Preventions1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Preventions_card(
          title: "Know how it spreads",
          img: "assets/Mask.svg",
          biganswer:
              "The best way to prevent COVID-19 is to avoid being exposed to this virus.",
          answer:
              '''» Between people who are in close contact with one another (within about 6 feet).
» Through respiratory droplets produced when an infected person coughs, sneezes
or talks.
» These droplets can land in the mouths or noses of people who are nearby or 
possibly be inhaled into the lungs.
» COVID-19 may be spread by people who are not showing symptoms.''',
        ),
        Preventions_card(
          title: "Clean your hands",
          img: "assets/Washing hands _Outline.svg",
          biganswer: "Wash your hands",
          answer:
              '''• If soap and water are not readily available, use a hand sanitizer that contains at 
least 60% alcohol. Cover all surfaces of your hands and rub them together until
they feel dry.
• Avoid touching your eyes, nose, and mouth with unwashed hands.''',
        ),
        Preventions_card(
          title: "Avoid close contact",
          img: "assets/social-distancing.svg",
          biganswer:
              " Limit contact with people who don’t live in your household as much as possible",
          answer: '''• Avoid close contact with people who are sick.
• Put distance between yourself and other people.
• Remember that some people without symptoms may be able to spread virus. 
• This is especially important for people who are at increased risk for severe''',
        ),
      ],
    );
  }
}

class Preventions2 extends StatelessWidget {
  const Preventions2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Preventions_card(
          title: "Wear a musk",
          img: "assets/Mask.svg",
          biganswer: "You could spread COVID-19 to others",
          answer:
              '''Everyone should wear a mask in public settings and when around people not 
living in their household, especially when social distancing is difficult to maintain. 
» Masks should not be placed on young children under age 2, anyone who has 
trouble breathing, or is unconscious, incapacitated or otherwise unable to remove 
the mask without assistance.
• A mask helps prevent a person who is sick from spreading the virus to others, 
and offers some protection to the wearer as well.
• Do NOT use a facemask meant for a healthcare worker. 
• Continue to keep at least 6 feet between yourself and others. The mask is not a 
substitute for social distancing''',
        ),
        Preventions_card(
          title: "Cover coughs",
          img: "assets/Washing hands _Outline.svg",
          biganswer: "Always cover your mouth and nose",
          answer: '''Throw used tissues in the trash.
• Immediately wash your hands with soap and water for at least 20 seconds. If 
soap and water are not readily available, clean your hands with a hand sanitizer that 
contains at least 60% alcohol.''',
        ),
        Preventions_card(
          title: "Clean and disinfect",
          img: "assets/gummy-wash-your-hands.svg",
          biganswer: "Clean AND disinfect frequently touched surfaces",
          answer:
              '''If surfaces are dirty, clean them: Use detergent or soap and water prior
to disinfection.
• Then, use a household disinfectant. You can see a list of EPA-registered 
household disinfectants here''',
        ),
      ],
    );
  }
}

class Preventions_card extends StatefulWidget {
  final String title, img, biganswer, answer;

  const Preventions_card(
      {Key? key,
      required this.title,
      required this.img,
      required this.answer,
      required this.biganswer})
      : super(key: key);

  @override
  State<Preventions_card> createState() => _Preventions_cardState();
}

class _Preventions_cardState extends State<Preventions_card> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => showSlidingBottomSheet(context,
              builder: (context) => SlidingSheetDialog(
                  builder: (context, state) => Material(
                        child: Padding(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          child: Column(
                            children: [
                              Text(
                                widget.biganswer,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        color: Colors.black, fontSize: 25.0),
                              ),
                              SizedBox(
                                height: kDefaultPadding,
                              ),
                              Text(
                                widget.answer,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      color: Colors.black.withOpacity(0.8),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  cornerRadius: 20.0,
                  snapSpec: SnapSpec(snappings: [0.8, 0.7]))),
          child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: kMainColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: SvgPicture.asset(
                widget.img,
                fit: BoxFit.cover,
              )),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.center,
          width: 100.0,
          child: Text(
            widget.title,
            style:
                Theme.of(context).textTheme.headline5!.copyWith(fontSize: 17),
          ),
        )
      ],
    );
  }
}
