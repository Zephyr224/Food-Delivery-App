import 'package:flutter/material.dart';

class TerrmsAndConditionsPage extends StatefulWidget {
  const TerrmsAndConditionsPage({super.key});

  @override
  State<TerrmsAndConditionsPage> createState() => _TerrmsAndConditionsPageState();
}

class _TerrmsAndConditionsPageState extends State<TerrmsAndConditionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: const Center(
        child: Text("Terms and Conditions Page"),
      ),
    );
  }
}