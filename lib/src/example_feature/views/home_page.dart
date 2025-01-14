import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/services/service_helpers/login_and_register_helpers.dart';
import 'package:food_delivery_app/core/utils/food_info.dart';
import 'package:food_delivery_app/src/example_feature/common/colors.dart';
import 'package:food_delivery_app/src/example_feature/common/constants.dart';
import 'package:food_delivery_app/src/example_feature/data/slider_data.dart';
import 'package:provider/provider.dart';

import '../widgets/body_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late TextEditingController searchController;

  // instantiate slider data
  SliderData sliderData = SliderData();

  // instantiate text controllers
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();

    // searchController = TextEditingController();

    context.read<SliderData>().startTimer();

    focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
    // searchController.dispose();

    sliderData.timer?.cancel();
    sliderData.pageController.dispose();
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
                expandedHeight: 130,
                collapsedHeight: 130,
                flexibleSpace: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodyTextWidget(
                      text: "Hello, Zephyr",
                      fontSize: 14,
                      color: colorH3,
                    ),
                    const SizedBox(height: 15),
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
                expandedHeight: 70,
                collapsedHeight: 70,
                pinned: true,
                flexibleSpace: SearchAnchor(
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
              ),
              SliverAppBar(
                expandedHeight: 260,
                collapsedHeight: 260,
                flexibleSpace: Consumer<SliderData>(
                  builder: (context, sliderValue, child) {
                    return PageView.builder(
                      controller: sliderValue.pageController,
                      allowImplicitScrolling: true,
                      itemCount: FoodInfo.foodSpecials.length,
                      onPageChanged: sliderValue.onPageChanged,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 240,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.asset(
                                      FoodInfo.foodSpecials[index],
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(  
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black.withOpacity(0.1),
                                            Colors.black.withOpacity(0.3),
                                          ],
                                        ),
                                      ),
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              FoodInfo.foodSpecialsNames[index],
                            ),
                          ],
                        );
                      },
                    );
                  },
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
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                ),
                initialItemCount: FoodInfo.foodOptions.length,
                itemBuilder: (context, index, animation) {
                  return GridTile(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 170,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Card(
                              color: Colors.blueGrey.shade300,
                              child: Image.asset(
                                FoodInfo.foodOptions[index],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          FoodInfo.foodOptionsNames[index],
                        ),
                      ],
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
