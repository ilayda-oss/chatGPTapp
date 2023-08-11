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
        print("temp ${value["id"]}");
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch (error) {
      print("error $error");
      rethrow;
    }
  }
}
