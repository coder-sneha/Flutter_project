import 'package:flutter/material.dart';
import 'package:pokemon_flutter/config/colors.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: PRIMARY_COLOR,
          )),
    );
  }
}
