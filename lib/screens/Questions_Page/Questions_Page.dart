import 'package:covidapp/constants.dart';
import 'package:flutter/material.dart';

class Questions_Page extends StatelessWidget {
  const Questions_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0,
        title: Text('Frequently Asked Questions'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding, horizontal: kDefaultPadding),
            child: ExpansionTile(
                title: Text(
              questions[index].title,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: Colors.black, fontSize: 20.0),
              ),
              children: [
                Text(
              questions[index].answer,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: Colors.black, fontSize: 17.0),
              ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Questions {
  final String title, answer;

  Questions({
    required this.title,
    required this.answer,
  });
}

List<Questions> questions = [
  Questions(
      title: 'What are the symptoms of COVID-19?',
      answer:
          'Some people infected with the virus have no symptoms. When the virus does cause symptoms, common ones include fever, body ache, dry cough, fatigue, chills, headache, sore throat, loss of appetite, and loss of smell. In some people, COVID-19 causes more severe symptoms like high fever, severe cough, and shortness of breath, which often indicates pneumonia.'),
  Questions(
      title:
          'What should I do if I think I or my child may have a COVID-19 infection?',
      answer: '''First, call your doctor or pediatrician for advice.
               be aware and wearing your mask.'''),
  Questions(
      title: 'How do I know if I have COVID-19 or the regular flu?',
      answer:
          '''COVID-19 often causes symptoms similar to those a person with a bad cold or the flu would experience. And like the flu, the symptoms can progress and become life-threatening
               Therefore, at the current time, people with "flulike" symptoms should assume they have COVID. That means isolating and contacting your doctor or local board of health to arrange testing.'''),
  Questions(
      title:
          'I recently spent time with someone who tested positive for COVID-19. I’m fully vaccinated. Do I need to get tested?',
      answer:
          '''Yes, you do. In July 2021, the CDC recommended that anyone who is fully vaccinated and comes into contact with someone who has, or is suspected of having, COVID-19 should get tested three to five days after exposure and wearing mask and using always alchohol'''),
  Questions(
      title:
          'Can a person who has been infected with coronavirus get infected again?',
      answer:
          '''Natural immunity to COVID-19 is the protection that results from having been sick. But we don't know how long natural immunity lasts, or how strong it is. We are learning that vaccination strengthens the natural immune response and reduces the risk that you will get infected again.
              There have been confirmed cases of reinfection with COVID-19.'''),
];
