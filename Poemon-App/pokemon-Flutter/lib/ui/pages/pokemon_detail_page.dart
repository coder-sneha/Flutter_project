import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_flutter/config/colors.dart';
import 'package:pokemon_flutter/config/routes.dart';
import 'package:pokemon_flutter/data/controllers/pokemon_detail_controller.dart';
import 'package:pokemon_flutter/ui/widgets/loading.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PokemonDetailController());

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: SECONDARY_COLOR,
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Obx(() {
            return controller.isLoading.value
                ? SizedBox(
                    height: size.height,
                    child: const Loading(),
                  )
                : Column(
                    children: [
                      Container(
                        color: SECONDARY_COLOR,
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 24,
                            ),
                            Image.asset("assets/images/logo.png"),
                            const SizedBox(
                              height: 28,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () => Get.back(),
                                  child: const Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    size: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 45,
                                  width: size.width * 0.65,
                                  child: const TextField(
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          isDense: true,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20.0),
                                              ),
                                              borderSide: BorderSide.none),
                                          filled: true,
                                          hintStyle: TextStyle(
                                              color: DISABLED_TEXT_COLOR,
                                              fontSize: 14),
                                          hintText: "Search Pokemon",
                                          fillColor: DISABLED_COLOR)),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(LEGAL_ROUTE);
                                  },
                                  child: const Icon(
                                    Icons.settings,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 180,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 150,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: PRIMARY_COLOR,
                                          borderRadius:
                                              BorderRadius.circular(23)),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Image.network(
                                        controller.pokemon.value!.image),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      controller.id,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: PRIMARY_COLOR),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      controller.pokemon.value!.name,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: size.width * 0.42,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controller.addToFavourites();
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color(0xFFFCA600)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      )),
                                    ),
                                    child: const Text(
                                      "Favourite",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.42,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.toNamed(POKEMON_GENERATION_ROUTE,
                                          arguments: {
                                            "pokemonId": controller.pokemonId
                                          });
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color(0x750083FC)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      )),
                                    ),
                                    child: const Text(
                                      "Generations",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(35),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: PRIMARY_COLOR,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              topRight: Radius.circular(45),
                            )),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 90,
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Height",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        controller.pokemon.value!.height,
                                        style: const TextStyle(
                                            color: DISABLED_COLOR),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                  child: Column(
                                    children: [
                                      const Text("Category",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        controller.pokemon.value!.category,
                                        style: const TextStyle(
                                            color: DISABLED_COLOR),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                  child: Column(
                                    children: [
                                      const Text("Weakness",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Column(
                                        children: controller
                                            .pokemon.value!.weakness
                                            .map((value) {
                                          return Row(
                                            children: [
                                              Container(
                                                height: 10,
                                                width: 10,
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFF1D8FF8),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                value["name"],
                                                style: const TextStyle(
                                                    color: DISABLED_COLOR),
                                              )
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 90,
                                  child: Column(
                                    children: [
                                      const Text("Weight",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        controller.pokemon.value!.weight,
                                        style: const TextStyle(
                                            color: DISABLED_COLOR),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                  child: Column(
                                    children: [
                                      const Text("Gender",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      controller.pokemon.value!.gender == "male"
                                          ? const Icon(
                                              Icons.male,
                                              color: DISABLED_COLOR,
                                              size: 19,
                                            )
                                          : controller.pokemon.value!.gender ==
                                                  "female"
                                              ? const Icon(
                                                  Icons.female,
                                                  color: DISABLED_COLOR,
                                                  size: 19,
                                                )
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(
                                                      Icons.female,
                                                      color: DISABLED_COLOR,
                                                      size: 19,
                                                    ),
                                                    Icon(
                                                      Icons.male,
                                                      color: DISABLED_COLOR,
                                                      size: 19,
                                                    ),
                                                  ],
                                                ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                  child: Column(
                                    children: [
                                      const Text("Skills",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white)),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Column(
                                        children: controller
                                            .pokemon.value!.skills
                                            .map((skill) {
                                          return Row(
                                            children: [
                                              Container(
                                                height: 10,
                                                width: 10,
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFF1D8FF8),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                skill.length >= 8
                                                    ? skill.substring(0, 6) +
                                                        ".."
                                                    : skill,
                                                style: const TextStyle(
                                                    color: DISABLED_COLOR),
                                              )
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
          }),
        ),
      )),
    );
  }
}
