import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_flutter/config/colors.dart';
import 'package:pokemon_flutter/config/routes.dart';
import 'package:pokemon_flutter/ui/pages/favourites_page.dart';
import 'package:pokemon_flutter/ui/pages/home_page.dart';
import 'package:pokemon_flutter/ui/pages/legal_page.dart';
import 'package:pokemon_flutter/ui/pages/pokemon_detail_page.dart';
import 'package:pokemon_flutter/ui/pages/pokemon_generation_page.dart';
import 'package:pokemon_flutter/ui/pages/privacy_policy_page.dart';
import 'package:pokemon_flutter/ui/pages/terms_and_conditions_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: PRIMARY_COLOR,
      ),
      initialRoute: HOME_ROUTE,
      getPages: [
        GetPage(name: HOME_ROUTE, page: () => const HomePage()),
        GetPage(
            name: POKEMON_DETAIL_ROUTE, page: () => const PokemonDetailPage()),
        GetPage(name: FAVOURITES_ROUTE, page: () => const FavouritesPage()),
        GetPage(
            name: POKEMON_GENERATION_ROUTE,
            page: () => const PokemonGenerationPage()),
        GetPage(name: LEGAL_ROUTE, page: () => const LegalPage()),
        GetPage(
            name: PRIVACY_POLICY_ROUTE, page: () => const PrivacyPolicyPage()),
        GetPage(
            name: TERMS_AND_CONDITIONS_ROUTE,
            page: () => const TermsAndConditionsPage()),
      ],
    );
  }
}
