import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/example_feature/views/profile_nav_views/about_page.dart';
import 'package:food_delivery_app/src/example_feature/views/profile_nav_views/settings_page.dart';
import 'package:food_delivery_app/src/example_feature/views/profile_nav_views/terrms_and_conditions_page.dart';

class SystemListTilePicker extends StatelessWidget {
  const SystemListTilePicker({super.key, required this.itemIndex});

  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    switch (itemIndex) {
      case 0:
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const SettingsPage();
              },
            ));
          },
          child: const ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text("Settings"),
          ),
        );
      case 1:
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const TerrmsAndConditionsPage();
              },
            ));
          },
          child: const ListTile(
            leading: Icon(Icons.file_copy_outlined),
            title: Text("Terms and Conditions"),
          ),
        );
      case 2:
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const AboutPage();
              },
            ));
          },
          child: const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("About"),
          ),
        );
        default:
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
  }
}