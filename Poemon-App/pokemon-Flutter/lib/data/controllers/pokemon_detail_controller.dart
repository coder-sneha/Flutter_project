import 'dart:convert';

import 'package:get/get.dart';
import 'package:pokemon_flutter/config/routes.dart';
import 'package:pokemon_flutter/data/models/pokemon_model.dart';
import 'package:pokemon_flutter/data/services/pokemon_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonDetailController extends GetxController {
  String pokemonId = Get.arguments["pokemonId"] ?? "";
  String id = Get.arguments["id"] ?? "";

  Rxn<Pokemon> pokemon = Rxn<Pokemon>();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    isLoading.value = true;
    PokemonService.getPokemon(id: pokemonId).then((res) {
      isLoading.value = false;

      if (res.status) {
        pokemon.value = res.data;
      }
    });
  }

  void addToFavourites() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    List<String>? favourites = sharedPreferences.getStringList('favourites');
    if (favourites == null) {
      sharedPreferences
          .setStringList("favourites", [json.encode(pokemon.value!.toJson())]);
      Get.toNamed(FAVOURITES_ROUTE);

      return;
    }

    bool isPokemonAlreadyFavourite = favourites.where((favourite) {
      return Pokemon.fromJson(json.decode(favourite)).id == pokemon.value!.id;
    }).isNotEmpty;
    if (isPokemonAlreadyFavourite) {
      Get.toNamed(FAVOURITES_ROUTE);

      return;
    }

    favourites.add(json.encode(pokemon.value!.toJson()));
    sharedPreferences.setStringList("favourites", favourites);

    Get.toNamed(FAVOURITES_ROUTE);
  }
}
