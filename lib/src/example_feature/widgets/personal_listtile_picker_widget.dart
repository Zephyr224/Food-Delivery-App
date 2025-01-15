import 'package:flutter/material.dart';
import 'package:food_delivery_app/src/example_feature/views/profile_nav_views/my_details_page.dart';
import 'package:food_delivery_app/src/example_feature/views/profile_nav_views/my_orders_page.dart';
import 'package:food_delivery_app/src/example_feature/views/profile_nav_views/notifications_page.dart';
import 'package:food_delivery_app/src/example_feature/views/profile_nav_views/offers_and_promos_page.dart';
import 'package:food_delivery_app/src/example_feature/views/profile_nav_views/payment_method_page.dart';

class PersonalListTilePicker extends StatelessWidget {
  const PersonalListTilePicker({
    super.key,
    required this.itemIndex,
  });

  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    switch (itemIndex) {
      case 0:
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const MyDetailsPage();
              },
            ));
          },
          child: const ListTile(
            leading: Icon(Icons.person_2_outlined),
            title: Text("My Details"),
          ),
        );
      case 1:
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const MyOrdersPage();
              },
            ));
          },
          child: const ListTile(
            leading: Icon(Icons.card_giftcard_outlined),
            title: Text("My Orders"),
          ),
        );
      case 2:
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const OffersAndPromosPage();
              },
            ));
          },
          child: const ListTile(
            leading: Icon(Icons.label_outline),
            title: Text("Offers and Promos"),
          ),
        );
      case 3:
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const NotificationsPage();
              },
            ));
          },
          child: const ListTile(
            leading: Icon(Icons.notifications_outlined),
            title: Text("Notifications"),
          ),
        );
      case 4:
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const PaymentMethodPage();
              },
            ));
          },
          child: const ListTile(
            leading: Icon(Icons.payment_outlined),
            title: Text("Payment Method"),
          ),
        );
      default:
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
  }
}
