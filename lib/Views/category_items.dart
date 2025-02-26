import 'package:clothing_stores_ui/Model/app_model.dart';
import 'package:clothing_stores_ui/Model/category_model.dart';
import 'package:clothing_stores_ui/Model/sub_category.dart';
import 'package:clothing_stores_ui/Views/Items_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CategoryItems extends StatelessWidget {
  final String category;
  final List<AppModel> categoryItems;

  const CategoryItems(
      {super.key, required this.category, required this.categoryItems});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_new),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          hintText: "$category's Fashion",
                          hintStyle: TextStyle(color: Colors.black38),
                          filled: true,
                          fillColor: Colors.amber,
                          focusedBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          prefixIcon: Icon(
                            Iconsax.search_normal,
                            color: Colors.black38,
                          ),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

             SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    filterCategory.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Row(
                          children: [
                            Text(filterCategory[index]),
                            SizedBox(width: 5),
                            index == 0
                                ? Icon(
                                    Icons.filter_list,
                                    size: 15,
                                  )
                                : Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 15,
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
           
            )
          ],
        ),
      ),
    );
  }
}
