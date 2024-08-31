import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper {
  // String url = "";
  String url = "https://sheetdb.io/api/v1/2x1zhjp2h7rzb";

  Future<List> apiLinkCalling()
  async {
    Uri uri = Uri.parse(url);
    Response response = await http.get(uri);
    if(response.statusCode==200)
      {
        final apiJson= jsonDecode(response.body);
        return apiJson;
      }else{
      print('api Link Calling Failed!!');
      return [];
    }
  }
}