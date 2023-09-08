import 'package:dio/dio.dart';
import 'package:pokemon_flutter/config/constants.dart';
import 'package:pokemon_flutter/data/models/pokemon_model.dart';
import 'package:pokemon_flutter/data/models/service_response_model.dart';

class PokemonService {
  static Future<ServiceResponse> getAllPokemons() async {
    try {
      List<Map> data = [];

      Response response =
          await Dio().get("${POKEMON_API_BASE_URL}pokemon?limit=10");

      for (Map item in response.data["results"]) {
        Response response = await Dio().get(item["url"]);

        data.add({
          "name": item["name"],
          "image": response.data["sprites"]["front_default"],
          "id": response.data["id"].toString()
        });
      }

      return ServiceResponse(true, data);
    } catch (e) {
      return ServiceResponse(false, []);
    }
  }

  static Future<ServiceResponse> getPokemon({required String id}) async {
    try {
      Response response = await Dio().get("${POKEMON_API_BASE_URL}pokemon/$id");

      String gender = response.data["front_female"] == null ? "male" : "female";

      String category = response.data["types"]
          .map((type) => type["type"]["name"])
          .toList()
          .join(", ");

      List weakness = [];
      for (Map type in response.data["types"]) {
        Response response = await Dio().get(type["type"]["url"]);

        weakness = response.data["damage_relations"]["double_damage_from"];
      }

      List skills =
          response.data["moves"].map((move) => move["move"]["name"]).toList();

      Pokemon data = Pokemon(
          id,
          response.data["name"],
          response.data["sprites"]["front_default"],
          response.data["height"].toString(),
          category,
          weakness,
          response.data["weight"].toString(),
          gender,
          skills);

      return ServiceResponse(true, data);
    } catch (e) {
      return ServiceResponse(false, {});
    }
  }

  static Future<ServiceResponse> getPokemonGenerations(
      {required String id}) async {
    try {
      Response response = await Dio().get("${POKEMON_API_BASE_URL}pokemon/$id");

      Map generations = response.data["sprites"]["versions"];

      List data = generations.entries.map((entry) {
        var secondElement;
        try {
          secondElement = entry.value.entries.elementAt(1);
        } catch (e) {
          secondElement = null;
        }

        return {
          "name1": entry.value.entries.first.key,
          "name2": secondElement != null ? secondElement.key : "",
          "image1": entry.value.entries.first.value["front_default"],
          "image2":
              secondElement != null ? secondElement.value["front_default"] : "",
        };
      }).toList();

      return ServiceResponse(true, data);
    } catch (e) {
      return ServiceResponse(false, {});
    }
  }
}
