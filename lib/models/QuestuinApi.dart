import 'package:http/http.dart' as http;

  Future getdata() async{
    var uri = Uri.https('coronavirus-symptoms-predictor1.p.rapidapi.com', '/' );
    // var uri = Uri.http(authority, unencodedPath)
    final response = await http.post(uri, headers: {
      "x-rapidapi-key": "43afa6b62amshd89517e0139478fp1edb4ajsn3fdb2eb2e2a0",
      "x-rapidapi-host": "coronavirus-symptoms-predictor1.p.rapidapi.com",
      "useQueryString": "true"
    });

    var responseBody = response.body;

    print(responseBody);

  }