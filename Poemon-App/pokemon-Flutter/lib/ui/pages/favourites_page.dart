import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_flutter/config/colors.dart';
import 'package:pokemon_flutter/config/routes.dart';
import 'package:pokemon_flutter/data/controllers/favourites_controller.dart';
import 'package:pokemon_flutter/ui/widgets/custom_app_bar.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());

    return Scaffold(
      backgroundColor: SECONDARY_COLOR,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(
              title: "Favourites",
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() {
                    return GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.favouritePokemons.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                mainAxisExtent: 145,
                                crossAxisSpacing: 20),
                        itemBuilder: (_, index) {
                          String id = (index + 1) > 9
                              ? "#0${index + 1}"
                              : "#00${index + 1}";

                          return GestureDetector(
                            onTap: () => Get.toNamed(POKEMON_DETAIL_ROUTE,
                                arguments: {
                                  "pokemonId":
                                      controller.favouritePokemons[index].id,
                                  "id": id
                                }),
                            child: SizedBox(
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: 120,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: PRIMARY_COLOR,
                                            borderRadius:
                                                BorderRadius.circular(23)),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 14,
                                                left: 15,
                                                right: 15),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            decoration: BoxDecoration(
                                                color: SECONDARY_TEXT_COLOR,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    offset: Offset(0, 33),
                                                    spreadRadius: 0,
                                                    blurRadius: 50,
                                                    color: Color.fromRGBO(
                                                        0, 0, 0, 0.37),
                                                  )
                                                ]),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  id,
                                                  style: const TextStyle(
                                                      color: PRIMARY_COLOR,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 13),
                                                ),
                                                Text(
                                                  controller
                                                              .favouritePokemons[
                                                                  index]
                                                              .name
                                                              .length >=
                                                          8
                                                      ? "${controller.favouritePokemons[index].name.substring(0, 6)}.."
                                                      : controller
                                                          .favouritePokemons[
                                                              index]
                                                          .name,
                                                  style: const TextStyle(
                                                      color: SECONDARY_COLOR,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 13),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Image.network(controller
                                          .favouritePokemons[index].image)),
                                ],
                              ),
                            ),
                          );
                        });
                  }),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
