import 'package:dio/dio.dart';
class ApiManager{
 Future <dynamic> getlocationInformation(){
   dynamic location=Dio().get("https://www.metaweather.com/api/location/1947122/");
   return location;
 }
}