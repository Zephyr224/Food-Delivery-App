import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/example_feature/common/constants.dart';
import 'package:food_delivery_app/src/example_feature/widgets/system_listtile_picker.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/service_helpers/login_and_register_helpers.dart';
import '../../widgets/personal_listtile_picker_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.all(customSafeArea),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  radius: 30,
                  child: Text("ZS"),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Username",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "email@gmail.com",
                      style: TextStyle(
                          // fontSize: 20,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.315,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return PersonalListTilePicker(itemIndex: index);
                },
              ),
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.grey.shade400),
            const SizedBox(height: 10),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.19,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return SystemListTilePicker(itemIndex: index);
                },
              ),
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.grey.shade400),
            const SizedBox(height: 10),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.06,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.read<LoginAndRegisterHelper>().logout();
                    },
                    child: const ListTile(
                      leading: Icon(Icons.logout_outlined),
                      title: Text("Logout"),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Divider(color: Colors.grey.shade400),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}


