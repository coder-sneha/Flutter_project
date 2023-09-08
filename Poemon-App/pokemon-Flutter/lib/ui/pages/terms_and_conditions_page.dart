import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:pokemon_flutter/ui/widgets/custom_app_bar.dart';
import 'package:pokemon_flutter/ui/widgets/loading.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: CustomAppBar(
                title: "Terms and Conditions",
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: rootBundle.loadString(
                      "assets/markdowns/terms_and_conditions_markdown.md"),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Markdown(data: snapshot.data!);
                    }

                    return const Center(
                      child: Loading(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
