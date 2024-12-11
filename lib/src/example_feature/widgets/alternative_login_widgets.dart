import 'package:flutter/material.dart';

import 'alternative_login_widget.dart';

class AppAlternativeLoginWidges extends StatelessWidget {
  const AppAlternativeLoginWidges({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AlternativeLoginWidget(
          assetPath: "assets/images/alt_logins/facebook.png",
          onTap: () {},
        ),
        AlternativeLoginWidget(
          assetPath: "assets/images/alt_logins/google.png",
          onTap: () {},
        ),
      ],
    );
  }
}