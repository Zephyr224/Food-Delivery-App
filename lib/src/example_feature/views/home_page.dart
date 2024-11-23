import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/services/service_helpers/login_and_register_helpers.dart';
import 'package:food_delivery_app/src/example_feature/common/constants.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    searchController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<LoginAndRegisterHelper>().logout();
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: customSafeArea),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
