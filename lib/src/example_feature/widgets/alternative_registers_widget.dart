import 'package:flutter/material.dart';

import 'alternative_login_widget.dart';

class AppAlternativeRegistersWidget extends StatelessWidget {
  const AppAlternativeRegistersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AlternativeLoginWidget(
            assetPath: "assets/images/facebook.png",
            onTap: () {},
          ),
          const SizedBox(width: 20),
          AlternativeLoginWidget(
            assetPath: "assets/images/google.png",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}