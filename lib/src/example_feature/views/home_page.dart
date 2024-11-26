import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/services/service_helpers/login_and_register_helpers.dart';
import 'package:food_delivery_app/src/example_feature/common/constants.dart';
import 'package:provider/provider.dart';

import '../widgets/search_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;

  // instantiate text controllers
  late FocusNode focusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    searchController = TextEditingController();

    focusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        focusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: SearchAnchor(
            builder: (context, controller) {
              return SearchBar(
                elevation: const WidgetStatePropertyAll(0),
                leading: const Icon(Icons.search),
                onTap: () {
                  controller.openView();
                },
                onChanged: (value) {
                  controller.openView();
                  // rest of code?
                },
                backgroundColor: const WidgetStatePropertyAll(Colors.white38),
              );
            },
            suggestionsBuilder: (context, controller) {
              return List<ListTile>.generate(
                5,
                (int index) {
                  final String item = "Item $index";
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(
                        () {
                          controller.closeView(item);
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.read<LoginAndRegisterHelper>().logout();
              },
              icon: const Icon(Icons.logout_rounded),
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: customSafeArea),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
