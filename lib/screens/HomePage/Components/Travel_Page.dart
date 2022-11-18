import 'package:covidapp/constants.dart';
import 'package:covidapp/widgets/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Travel_Page extends StatefulWidget {
  const Travel_Page({Key? key}) : super(key: key);

  @override
  State<Travel_Page> createState() => _Travel_PageState();
}

class _Travel_PageState extends State<Travel_Page> {
  TextEditingController _countryCtr = TextEditingController();

  GlobalKey<FormState> _key = GlobalKey<FormState>();

  bool value = false;

  List _data = [];

  Future<void> getTravel() async {
    var uri = Uri.https(
      'eu-covid-19-travel.p.rapidapi.com',
      '/country/${_countryCtr.text}',
    );

    final response = await http.get(uri, headers: {
      'x-rapidapi-host': 'eu-covid-19-travel.p.rapidapi.com',
      'x-rapidapi-key': '43afa6b62amshd89517e0139478fp1edb4ajsn3fdb2eb2e2a0'
    });

    final jsonBody = jsonDecode(response.body);

    print(jsonBody);

    setState(() {
      _data.addAll(jsonBody);
    });

    print(_data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: 
        Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.0,),
                Text(
                  "Write the country",
                  style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                    color: kTextColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: _countryCtr,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is requird';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(color: kMainColor, width: 2)),
                      fillColor: Colors.white,
                      suffixIcon: _countryCtr.text.isEmpty
                          ? Container(
                              width: 0,
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.clear,
                                color: kMainColor,
                              ),
                              onPressed: () => _countryCtr.clear(),
                            ),
                      hintText: "country",
                      prefixIcon: Icon(
                        Icons.explore,
                        color: Color(0xff717171),
                      ),
                      hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Color(0xff474747), fontWeight: FontWeight.w300),
                      border: InputBorder.none),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            GestureDetector(
              onTap: () {
                if (_key.currentState!.validate()) {
                  getTravel();
                }
              },
              child: RoundedButton(title: "Travel"),
            ),
            Expanded(
              child: _data.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Travel_Card(
                                title: 'colour',
                                number: '${_data[index]['colour']}'),
                            Travel_Card(
                                title: 'national_cases_7',
                                number: '${_data[index]['national_cases_7']}'),
                            Travel_Card(
                                title: 'national_population',
                                number: '${_data[index]['national_population']}'),
                            Travel_Card(
                                title: 'national_positivity_rate',
                                number:
                                    '${_data[index]['national_positivity_rate']}'),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Travel_Card extends StatelessWidget {
  final String title, number;

  const Travel_Card({Key? key, required this.title, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 110,
      decoration: BoxDecoration(
          color: kMainColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            number,
            style: TextStyle(
                color: kMainColor, fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
