import 'package:get/get.dart';
import 'package:pokemon_flutter/data/services/pokemon_service.dart';

class PokemonGenerationController extends GetxController {
  String pokemonId = Get.arguments["pokemonId"] ?? "";

  RxList generations = [].obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    isLoading.value = true;
    PokemonService.getPokemonGenerations(id: pokemonId).then((res) {
      isLoading.value = false;

      if (res.status) {
        generations.value = res.data;
      }
    });
  }
}
