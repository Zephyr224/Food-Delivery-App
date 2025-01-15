import 'package:flutter/material.dart';

class OffersAndPromosPage extends StatefulWidget {
  const OffersAndPromosPage({super.key});

  @override
  State<OffersAndPromosPage> createState() => _OffersAndPromosPageState();
}

class _OffersAndPromosPageState extends State<OffersAndPromosPage> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: const Center(
        child: Text("Offers and Promos"),
      ),
    );
  }
}