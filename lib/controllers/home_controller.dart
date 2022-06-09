import 'package:dio/dio.dart';
import 'package:funapp/models/activity.dart';
import 'package:funapp/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:hive/hive.dart';

class HomeController extends GetxController{
 late Future<Activity> futureActivity;
   late final Box box;

@override 
void onInit() { super.onInit();
             futureActivity =fetchActivity();
 }

void navigation(){
  Get.to(Routes.favoris); } 

Future<Activity> fetchActivity() async {
  final response = await http
      .get(Uri.parse('http://www.boredapi.com/api/activity'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Activity.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Activity');
  }
}


}


