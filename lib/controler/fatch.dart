import 'dart:convert';

import 'package:http/http.dart';

class Fatchmeme {
  static getFatch() async {
    Response response = await get(Uri.parse("https://meme-api.com/gimme"));

    Map data = jsonDecode(response.body);
    print(data['url']);
    return (data['url']);
  }
}
