import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_flutter/config/colors.dart';
import 'package:pokemon_flutter/data/controllers/pokemon_generation_controller.dart';
import 'package:pokemon_flutter/ui/widgets/custom_app_bar.dart';
import 'package:pokemon_flutter/ui/widgets/loading.dart';

class PokemonGenerationPage extends StatelessWidget {
  const PokemonGenerationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PokemonGenerationController());

    return Scaffold(
      backgroundColor: SECONDARY_COLOR,
      body: SafeArea(
          child: Column(
        children: [
          const CustomAppBar(title: "Evolution Chain"),
          Obx(() {
            return controller.isLoading.value
                ? const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Loading(),
                  )
                : Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(28.0),
                      child: ListView.builder(
                          itemCount: controller.generations.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 80,
                                        child: Column(
                                          children: [
                                            Image.network(
                                              controller.generations[index]
                                                  ["image1"],
                                              width: 80,
                                              height: 80,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              controller.generations[index]
                                                  ["name1"],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            )
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "Generation ${index + 1}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        width: 80,
                                        child: Column(
                                          children: [
                                            controller.generations[index]
                                                        ["image2"] !=
                                                    ""
                                                ? Image.network(
                                                    controller
                                                            .generations[index]
                                                        ["image2"],
                                                    width: 80,
                                                    height: 80,
                                                  )
                                                : const SizedBox(),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              controller.generations[index]
                                                  ["name2"],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.center,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Divider(
                                    height: 1,
                                    color: DISABLED_COLOR,
                                    thickness: 1,
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  );
          }),
        ],
          )),
    );
  }
}
