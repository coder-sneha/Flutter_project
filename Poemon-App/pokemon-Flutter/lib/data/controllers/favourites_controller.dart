import 'dart:convert';

import 'package:get/get.dart';
import 'package:pokemon_flutter/data/models/pokemon_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouritesController extends GetxController {
  RxList<Pokemon> favouritePokemons = <Pokemon>[].obs;

  @override
  void onInit() {
    super.onInit();

    getFavourites();
  }

  Future getFavourites() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final List<String>? favourites =
        sharedPreferences.getStringList('favourites');
    if (favourites == null) {
      favouritePokemons.value = [];
      return;
    }

    favouritePokemons.value = favourites.map((favourite) {
      return Pokemon.fromJson(json.decode(favourite));
    }).toList();
  }
}
