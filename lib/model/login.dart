// import 'dart:convert';
// import 'package:blog_app/data/User.dart';
// import 'package:http/http.dart' as http;

// final _base = "http://6f024a03defc.ngrok.io/api";
// final _tokenEndpoint = "/user/login";
// final _tokenURL = _base + _tokenEndpoint;

// Future<Token> getToken(UserLogin userLogin) async {
//   print(_tokenURL);
//   print("users=" + jsonEncode(userLogin));
//   final http.Response response = await http.post(
//     _tokenURL,
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(userLogin.toDatabaseJson()),
//   );
//   print(userLogin.toDatabaseJson());
//   if (response.statusCode == 200) {
//     print(response.body);
//     return Token.fromJson(json.decode(response.body));
//   } else {
//     print(json.decode(response.body).toString());
//     throw Exception(json.decode(response.body));
//   }
// }
