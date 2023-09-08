import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_flutter/config/routes.dart';
import 'package:pokemon_flutter/ui/widgets/custom_app_bar.dart';

class LegalPage extends StatelessWidget {
  const LegalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: "Legal"),
            Expanded(
              child: ListView(
                children: [
                  InkWell(
                    onTap: () => Get.toNamed(PRIVACY_POLICY_ROUTE),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Privacy Policy",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          Icon(
                            Icons.chevron_right_outlined,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(TERMS_AND_CONDITIONS_ROUTE),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Terms and Conditions",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          Icon(
                            Icons.chevron_right_outlined,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
