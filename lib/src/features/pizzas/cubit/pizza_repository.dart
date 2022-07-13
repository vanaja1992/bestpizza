import 'dart:convert';

import 'package:favorite_pizza/src/core/assets/app_assets.dart';
import 'package:favorite_pizza/src/core/helpers/file_helper.dart';
import 'package:favorite_pizza/src/model/pizza/pizza_model.dart';

class PizzaRepository{

  Future<List<PizzaModel>>fetchRestaurants() async {
    String pizzaDataJson = await FileHelper.readFile(AppAssets.pizzaDataJsonPath);
    List<dynamic> decodedPizzaList = jsonDecode(pizzaDataJson);
    List<PizzaModel> pizzaModel = decodedPizzaList.map((pizzadata) => pizzaModelFromJson(pizzadata)).toList();
    return pizzaModel;

  }
}