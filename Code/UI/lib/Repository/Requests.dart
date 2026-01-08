import 'package:dio/dio.dart';
import 'package:e_nose/Models/Result.dart';

class Requests{
  String api_link = "http://192.168.1.3:5000";

  Future get_result() async{
    try{
      Response response = await Dio().get("http://127.0.0.1:41144/result");
      print(response);
      return response;
    }
    on DioException catch(e){
      return e;
    }
  }

}