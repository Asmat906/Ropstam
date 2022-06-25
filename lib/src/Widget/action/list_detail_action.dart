 
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../views/listview_model.dart';


Future<List<Ropstam>> getProductList() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/Posts'));
  List jsonResponse = json.decode(response.body);
  return jsonResponse.map((job) => new Ropstam.fromJson(job)).toList();
  
}