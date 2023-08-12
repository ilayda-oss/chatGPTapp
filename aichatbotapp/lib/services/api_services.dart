import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:developer';
import 'package:aichatbotapp/constants/api_constants.dart';
import 'package:aichatbotapp/models/models_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var responce = await http.get(
        Uri.parse("$BASE_URL/models"),
        headers: {'Authorization': 'Bearer $API_KEY'},
      );
      Map jsonResponce = jsonDecode(responce.body);
      if (jsonResponce['error'] != null) {
        // print("jsonResponce['error'] ${jsonResponce['error']["message"]}");
        throw HttpException(jsonResponce['error']["message"]);
      }
      // print("jsonResponce $jsonResponce");
      List temp = [];
      for (var value in jsonResponce["data"]) {
        temp.add(value);
        //  print("temp ${value["id"]}");
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch (error) {
      print("error $error");
      rethrow;
    }
  }

  // Send Message fct
  static Future<void> sendMessage(
      {required String message, required String modelId}) async {
    try {
      var responce = await http.post(Uri.parse("$BASE_URL/chat/completions"),
          headers: {
            'Authorization': 'Bearer $API_KEY',
            "Content-Type": "application/json"
          },
          body: jsonEncode({
            "model": "gpt-3.5-turbo",
            "messages": [
              {"role": "user", "content": "Hello what is flutter"}
            ],
            "temperature": 0.7
          }));

      Map jsonResponce = jsonDecode(responce.body);
      if (jsonResponce['error'] != null) {
        // print("jsonResponce['error'] ${jsonResponce['error']["message"]}");
        throw HttpException(jsonResponce['error']["message"]);
      }
      if (jsonResponce["choices"].length > 0) {
        print("jsonResponce[choices]text ${jsonResponce["choices"]["text"]}");
      }
    } catch (error) {
      print("error $error");
      rethrow;
    }
  }
}
