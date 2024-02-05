import 'dart:convert';

import 'package:myfood/models/foodmodel.dart';
import 'package:http/http.dart' as http;

class FoodApi {
  static Future<List<FoodModel>> getMyFood() async {
    var myUri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": '24', "start": '0', "tag": "list.recipe.popular"});
    final response = await http.get(myUri, headers: {
      'X-RapidAPI-Key': '9f1829285dmsh067e3095fc89e7ep170b8djsn578aa4877a34',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
    });

    Map data = jsonDecode(response.body);
    List chatch = [];
    for (var i in data['feed']) {
      chatch.add(i['content']['details']);
    }
    return FoodModel.foodsFromSnapshot(chatch);
  }
}
