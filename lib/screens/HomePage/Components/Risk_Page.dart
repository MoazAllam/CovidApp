import 'dart:convert';
import 'package:covidapp/constants.dart';
import 'package:covidapp/widgets/RoundedButton.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Risk_Page extends StatefulWidget {
  const Risk_Page({Key? key}) : super(key: key);

  @override
  State<Risk_Page> createState() => _Risk_PageState();
}

class _Risk_PageState extends State<Risk_Page> {
  List _temp = [];

  Future<void> getdata() async {
    var uri = Uri.https(
      'vaccovid-coronavirus-vaccine-and-treatment-tracker.p.rapidapi.com',
      '/api/npm-covid-data/country-report-iso-based/Egypt/egy',
    );

    final response = await http.get(uri, headers: {
      'x-rapidapi-host':
          'vaccovid-coronavirus-vaccine-and-treatment-tracker.p.rapidapi.com',
      'x-rapidapi-key': '43afa6b62amshd89517e0139478fp1edb4ajsn3fdb2eb2e2a0'
    });

    final jsonBody = jsonDecode(response.body);

    print(jsonBody);

    setState(() {
      _temp.addAll(jsonBody);
    });

    print(_temp);
  }

  @override
  void initState() {
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              SizedBox(height: 50,),
              Container(
                height: 200,
                  child: _temp.isEmpty ? 
                  Center(child: CircularProgressIndicator(),)
                  :
                  ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Risk_Card(
                          title: 'Infection Risk',
                          number: '${_temp[index]['Infection_Risk']}'
                      );
                    },
                  ),
              ),
              Container(
                height: 200,
                  child: _temp.isEmpty ? 
                  Center(child: CircularProgressIndicator(),)
                  :
                  ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Risk_Card(
                          title: 'Case Fatality Rate',
                          number: '${_temp[index]['Case_Fatality_Rate']}'
                      );
                    },
                  ),
              ),
              SizedBox(height: 50,),
              GestureDetector(
                onTap: getdata,
                child: RoundedButton(
                  title: "Get Risk"
                ),
              ),
            ],
          ),
        ));
  }
}

class Risk_Card extends StatelessWidget {
  final String title, number;

  const Risk_Card({Key? key, required this.title, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding),
            width: double.infinity,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.black.withOpacity(0.5)),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  number,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(color: Colors.red, fontSize: 70.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
