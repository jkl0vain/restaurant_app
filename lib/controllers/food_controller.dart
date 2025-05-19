import 'dart:math';

import 'package:get/get.dart';
import 'package:restaurant_foodly/models/additives_model.dart';

class FoodController extends GetxController{
  String _category = '';

  String get category => _category;

  set setCategory(String newValue){
    _category = newValue;
    print(category);
  }

  RxList<String> _types = <String>[].obs;

  RxList<String> get types => _types;

  set setTypes(String newValue){
    _types.add(newValue);
  }

  int generateId(){
    int min = 0;
    int max = 10000;

    final _random = Random();
    return min + Random().nextInt(max-min);
  }

  RxList<Additive> _additiveList = <Additive>[].obs;

  RxList<Additive> get additiveList => _additiveList;

  get tags => null;

  set setTags(String setTags) {
      _types.add(setTags);

  }

  set addAdditive(Additive newValue){
    _additiveList.add(newValue);
  }

  void clearAdditives(){
    _additiveList.clear();
  }
}