import 'package:get/get.dart';
import 'package:pokemon_flutter/data/services/pokemon_service.dart';

class HomeController extends GetxController {
  List pokemons = [].obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    isLoading.value = true;
    PokemonService.getAllPokemons().then((res) {
      isLoading.value = false;

      if (res.status) {
        pokemons.assignAll(res.data);
      }
    });
  }
}
