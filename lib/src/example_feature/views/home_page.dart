import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/services/service_helpers/login_and_register_helpers.dart';
import 'package:food_delivery_app/src/example_feature/common/colors.dart';
import 'package:food_delivery_app/src/example_feature/common/constants.dart';
import 'package:provider/provider.dart';

import '../widgets/body_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late TextEditingController searchController;

  // instantiate text controllers
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();

    // searchController = TextEditingController();

    focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
    // searchController.dispose();
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
          actions: [
            IconButton(
              onPressed: () {
                context.read<LoginAndRegisterHelper>().logout();
              },
              icon: const Icon(Icons.logout_rounded),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: customSafeArea),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: false,
                expandedHeight: 150,
                collapsedHeight: 150,
                flexibleSpace: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodyTextWidget(
                      text: "Hello, Zephyr",
                      fontSize: 14,
                      color: colorH3,
                    ),
                    const SizedBox(height: 20),
                    const BodyTextWidget(
                      text: "Stay home, let",
                      fontSize: 30,
                    ),
                    const BodyTextWidget(
                      text: "the food come to you",
                      fontSize: 30,
                    ),
                  ],
                ),
              ),
              SliverAppBar(
                expandedHeight: 110,
                collapsedHeight: 110,
                pinned: true,
                flexibleSpace: Column(
                  children: [
                    SearchAnchor(
                      builder: (context, controller) {
                        return SearchBar(
                          elevation: const WidgetStatePropertyAll(0),
                          leading: const Icon(Icons.search),
                          trailing: List.of(
                            [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.location_on_sharp,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          hintText: "Search resturants and cuisine",
                          hintStyle: WidgetStatePropertyAll(TextStyle(
                              fontSize: 15, color: textFieldHintTextColor)),
                          onTap: () {
                            controller.openView();
                          },
                          onChanged: (value) {
                            controller.openView();
                            // rest of code?
                          },
                          backgroundColor: const WidgetStatePropertyAll(
                              searchBarBackgroundColor),
                        );
                      },
                      suggestionsBuilder: (context, controller) {
                        // latest searched items
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
                    const SizedBox(height: 10),
                    Expanded(
                      child: SizedBox(
                        height: 30,
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(4),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  side: index == 1
                                      ? const BorderSide(color: Colors.blueGrey)
                                      : BorderSide.none,
                                ),
                                child: Text(
                                  "Popular",
                                  style: TextStyle(
                                      color: index == 1 ? colorH3 : colorH4),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SliverAppBar(
                expandedHeight: 60,
                flexibleSpace: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: BodyTextWidget(
                        text: "Popular",
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              SliverAnimatedGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                initialItemCount: 20,
                itemBuilder: (context, index, animation) {
                  return GridTile(
                    header: const Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: Icon(Icons.add_card),
                    ),
                    // footer: const Icon(Icons.remove_circle),
                    child: Card(
                      color: Colors.blueGrey.shade300,
                      child: Text("Item ${index + 1}"),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
