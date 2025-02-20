import 'package:clothing_stores_ui/Model/app_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ItemsDetailScreen extends StatefulWidget {
  final AppModel eCommerceApp;

  const ItemsDetailScreen({super.key, required this.eCommerceApp});

  @override
  State<ItemsDetailScreen> createState() => _ItemsDetailScreenState();
}

class _ItemsDetailScreenState extends State<ItemsDetailScreen> {
  int currentIndex = 0;
  int selectedColorIndex = 1;
  int selectedSizeIndex = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text("Detail Product"),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Iconsax.shopping_bag,
                size: 28,
              ),
              Positioned(
                right: -3,
                top: -5,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      "3",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 20),
        ],
      ),
      
         
    );
  }
}
