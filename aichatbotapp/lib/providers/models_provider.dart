import 'package:aichatbotapp/models/models_model.dart';
import 'package:aichatbotapp/services/api_services.dart';
import 'package:flutter/material.dart';

class ModelsProvider with ChangeNotifier {
  String currentModel = "text-davinci-003";

  String get getCurrentModel {
    return currentModel;
  }

  void setCurrentModel(String newModel) {
    currentModel = newModel;
    notifyListeners();
  }

  List<ModelsModel> modelsList = [];
  List<ModelsModel> get getmodelsList {
    return modelsList;
  }

  Future<List<ModelsModel>> gelAllModels() async {
    modelsList = await ApiService.getModels();
    return modelsList;
  }
}
