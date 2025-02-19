import 'package:clothing_stores_ui/Model/category_model.dart';
import 'package:clothing_stores_ui/Views/Items_detail_screen.dart';
import 'package:clothing_stores_ui/Views/Widgets/banner.dart';
import 'package:clothing_stores_ui/Views/Widgets/curated_items.dart';
import 'package:clothing_stores_ui/Views/category_items.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:clothing_stores_ui/Model/app_model.dart';

class AppHomeScreen extends StatefulWidget {
  const AppHomeScreen({super.key});

  @override
  State<AppHomeScreen> createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 40,
                  ),
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),


            const SizedBox(height: 20),

            // Banner
            const MyBanner(),

             // Shop By Category Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shop By Category",
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 0,
                      color: Colors.black45,
                    ),
                  )
                ],
              ),
            ),

            // Category List
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  category.length,
                  (index) => InkWell(
                    onTap: () {
                      //Filter Products Based Selected Category
                      final filterItems = fashionEcommerceApp
                          .where((item) =>
                              item.category.toLowerCase() ==
                              category[index].name.toLowerCase())
                          .toList();

                      //Navigate to the CategoryItems Screen with Filtered List
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CategoryItems(
                            category: category[index].name,
                            categoryItems: filterItems,
                          ),
                        ),
                      );
                    }, // Added onTap to InkWell
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.amberAccent,
                            backgroundImage: AssetImage(category[index].image),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(category[index].name),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          
      ),
    );
  }
}
