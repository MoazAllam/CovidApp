// import 'dart:convert';
// import 'package:covidapp/models/RiskModel.dart';
// import 'package:http/http.dart' as http;

// class RiskApi {
//   static Future<List<Risk>> getRisk() async {
//     var uri = Uri.https(
//       'https://vaccovid-coronavirus-vaccine-and-treatment-tracker.p.rapidapi.com',
//       '/api/npm-covid-data/africa',
//     );

//     final response = await http.get(uri, headers: {
//       'x-rapidapi-host':
//           'vaccovid-coronavirus-vaccine-and-treatment-tracker.p.rapidapi.com',
//       'x-rapidapi-key': '43afa6b62amshd89517e0139478fp1edb4ajsn3fdb2eb2e2a0'
//     });

//     Map data = jsonDecode(response.body);
//     List _temp = [];

//     // for (var i in data['']) {
//     //   _temp.add(i['content']['details']);
//     // }

//     _temp.add(['Infection_Risk']);

//     return Risk.riskFromSnapshot(_temp);
//   }
// }
