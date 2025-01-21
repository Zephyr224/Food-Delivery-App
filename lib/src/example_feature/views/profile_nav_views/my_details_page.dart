import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/example_feature/common/constants.dart';

class MyDetailsPage extends StatefulWidget {
  const MyDetailsPage({super.key});

  @override
  State<MyDetailsPage> createState() => _MyDetailsPageState();
}

class _MyDetailsPageState extends State<MyDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text("My Details"),
        ),
        body: const Padding(
          padding: EdgeInsets.all(customSafeArea),
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
              ),
          
            ],
          ),
        ));
  }
}
