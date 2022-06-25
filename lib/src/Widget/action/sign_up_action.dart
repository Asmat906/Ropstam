import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/app_headers.dart';

Future<http.Response> simplelogin(data) async{
  var url = Uri.parse("http://buddy.ropstambpo.com/api/login");
  final result = await http.post(
    url,body: jsonEncode(data),headers: ApiHeaders().headers);
    
     var logindata = jsonDecode(result.body);
    print("mmmmmmmmmmmmmmmmmmmmmmmmmmbbbbb,,,,$logindata");
    return result;
}