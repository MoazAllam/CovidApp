import 'package:covidapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';

class Health extends StatefulWidget {
  const Health({Key? key}) : super(key: key);

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding),
          child: Column(
            children: [
              Text("What syndroms do you have ?",
                  style:
                      TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 40.0,
              ),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Syndrom_Page(
                                    title: "Lung problems, including asthma.",
                                    advice:
                                        "We should all take steps to protect ourselves and others from infection by getting a COVID-19 vaccine, washing hands often, avoiding crowded places, wearing a mask, and staying at least 6 feet from other people.",
                                    risk: "High"))),
                        child: Syndrom_Card(
                          title: "Lung problems",
                          icon: FontAwesomeIcons.lungs,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Syndrom_Page(
                                    title: "Heart disease.",
                                    advice: '''
According to a recent report from the CDC, persons with conditions such as heart disease, lung disease and were 6 times more likely to be hospitalized and 12 times more likely to die from the COVID-19 coronavirus compared with persons without underlying health conditions.

To reduce your risk of contracting the new coronavirus, all persons, especially those with heart disease, should:
Maintain social distancing and stay at home.

Avoid hugging and handshaking.

Make sure you have enough medications on hand so you don’t have to leave home to pick up a prescription.

Wash your hands frequently. Use hand sanitizer when you can’t.

Keep surfaces at home clean, including counters and doorknobs, and avoid touching surfaces when away from home.

Find stress-reducing activities that help you mentally, such as low-impact exercise, walking, meditation, and centering prayer. Spend more time on your hobbies.

If you get sick, don't panic. Stay home and call your physician’s office. There are other viruses out there, including influenza, all with similar symptoms. If you have symptoms of the coronavirus (high fever, dry cough, difficulty breathing), your doctor may order screening for the COVID-19 coronavirus.
''',
                                    risk: "High"))),
                        child: Syndrom_Card(
                          title: "Heart disease",
                          icon: FontAwesomeIcons.heart,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Syndrom_Page(
                                    title: "Diabetes and obesity",
                                    advice:
                                        '''This risk can be reduced by keeping blood sugar levels controlled and continuing your diabetes medications and insulin. If you are overweight or obese, aim to lose weight by eating a healthy diet and getting regular physical activity.''',
                                    risk: "High"))),
                        child: Syndrom_Card(
                          title: "Diabetes",
                          icon: FontAwesomeIcons.disease,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Syndrom_Page(
                                    title:
                                        "Cancer and certain blood disorders.",
                                    advice:
                                        '''People with blood cancers may be at higher risk of prolonged infection and death from COVID-19 than people with solid tumors. That is because patients with blood cancers often have abnormal or depleted levels of immune cells that produce antibodies against viruses.

To protect yourself and prevent the spread of COVID-19:

-Get a COVID-19 vaccination.

-Wear a well-fitting mask that covers your nose and mouth.

-Stay 6 feet away from people who don’t live with you.

-Avoid crowds and poorly ventilated indoor spaces.

-Wash your hands often with soap and water. 

-Use hand sanitizer if soap and water aren’t available.

-Cover coughs and sneezes.

-Clean and disinfect frequently touched surfaces daily.

-Be alert for symptoms of COVID-19.''',
                                    risk: "High"))),
                        child: Syndrom_Card(
                          title: "Cancer",
                          icon: FontAwesomeIcons.disease,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Syndrom_Page(
                                    title: "HIV/AIDS",
                                    advice:
                                        '''If you have HIV and are taking your HIV medicine, it is important to continue your treatment and follow your health care provider’s advice. This is the best way to keep your immune system healthy.''',
                                    risk: "High"))),
                        child: Syndrom_Card(
                          title: "HIV/AIDS",
                          icon: FontAwesomeIcons.disease,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Syndrom_Page(
                                    title: "Smoker",
                                    advice:
                                        '''While there is no definitive proof that smoking makes someone more susceptible to contracting COVID-19, smokers could have an increased risk of being hospitalized or being placed on a ventilator if they get the virus.
                                        
but still takecare and stay safe''',
                                    risk: "Medium"))),
                        child: Syndrom_Card(
                          title: "Smoker",
                          icon: LineIcons.smoking,
                        ),
                      )
                    ],
                  ),
                ],
              ))
            ],
          ),
        ));
  }
}

class Syndrom_Page extends StatelessWidget {
  final String title, advice, risk;

  const Syndrom_Page(
      {Key? key, required this.title, required this.advice, required this.risk})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0,
        title: Text("Syndroms"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                "Your Risk is ${risk}",
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                advice,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Syndrom_Card extends StatefulWidget {
  final String title;
  final IconData icon;

  const Syndrom_Card({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  State<Syndrom_Card> createState() => _Syndrom_CardState();
}

class _Syndrom_CardState extends State<Syndrom_Card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 170,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: kMainColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            color: kMainColor,
            size: 70.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            widget.title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}