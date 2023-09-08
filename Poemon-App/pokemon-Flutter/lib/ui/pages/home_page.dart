import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_flutter/config/colors.dart';
import 'package:pokemon_flutter/config/routes.dart';
import 'package:pokemon_flutter/data/controllers/home_controller.dart';
import 'package:pokemon_flutter/ui/widgets/loading.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: SECONDARY_COLOR,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Get.toNamed(FAVOURITES_ROUTE);
                    },
                    icon: const Icon(
                      Icons.favorite_outlined,
                      color: PRIMARY_COLOR,
                    )),
              ),
              Image.asset("assets/images/logo.png"),
              const SizedBox(
                height: 28,
              ),
              SizedBox(
                height: 45,
                width: size.width * 0.75,
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
                        hintStyle:
                            TextStyle(color: DISABLED_TEXT_COLOR, fontSize: 14),
                        hintText: "Search Pokemon",
                        fillColor: DISABLED_COLOR)),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(() {
                return controller.isLoading.value
                    ? const Loading()
                    : GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.pokemons.length,
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
                                  "pokemonId": controller.pokemons[index]["id"],
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
                                                              .pokemons[index]
                                                                  ["name"]
                                                              .length >=
                                                          8
                                                      ? controller
                                                              .pokemons[index]
                                                                  ["name"]
                                                              .substring(0, 6) +
                                                          ".."
                                                      : controller
                                                              .pokemons[index]
                                                          ["name"],
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
                                      child: Image.network(
                                        controller.pokemons[index]["image"],
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.fill,
                                      )),
                                ],
                              ),
                            ),
                          );
                        });
              }),
            ],
          ),
        ),
      )),
    );
  }
}
