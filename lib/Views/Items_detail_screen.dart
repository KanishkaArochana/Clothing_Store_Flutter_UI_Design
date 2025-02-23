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
      body: ListView(
        children: [
          SizedBox(
            // color: Colors.amber,
            height: size.height * 0.46,
            width: size.width,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
                // If can multiple Image
              },
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Hero(
                      tag: widget.eCommerceApp.image,
                      child: Image.asset(
                        widget.eCommerceApp.image,
                        height: size.height * 0.4,
                        width: size.width * 0.85,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          3,
                          (index) => AnimatedContainer(
                                duration: Duration(microseconds: 300),
                                margin: EdgeInsets.only(right: 4),
                                width: 7,
                                height: 7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: index == currentIndex
                                      ? Colors.blue
                                      : Colors.grey.shade400,
                                ),
                              )),
                    ),
                  ],
                );
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "H&M",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black26,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 17,
                    ),
                    Text(widget.eCommerceApp.rating.toString()),
                    Text(
                      "(${widget.eCommerceApp.review})",
                      style: const TextStyle(
                        color: Colors.black26,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.favorite_border),
                  ],
                ),
 Text(
                  widget.eCommerceApp.name,
                  maxLines: 1,
                  // overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "\$${widget.eCommerceApp.price.toString()}.00",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.red,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(width: 5),
                    if (widget.eCommerceApp.isCheck == true)
                      Text(
                        "\$${widget.eCommerceApp.price + 255}.00",
                        style: TextStyle(
                          color: Colors.black26,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black26,
                        ),
                      ),
                  ],
                ),      

                 SizedBox(height: 15),
                Text(
                  widget.eCommerceApp.description,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black38,
                    letterSpacing: -.5,
                  ),
                ),    

 SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width / 2.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //For Color
                          Text(
                            "Color",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: widget.eCommerceApp.fcolor
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                final int index = entry.key;
                                final color = entry.value;
                                return Padding(
                                  padding: EdgeInsets.only(top: 10, right: 10),
                                  child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: color,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedColorIndex =
                                              index; //Update the selected Indexs
                                        });
                                      },
                                      child: Icon(
                                        Icons.check,
                                        color: selectedColorIndex == index
                                            ? Colors.white
                                            : Colors.transparent,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),

                     // For Size
                    SizedBox(
                      width: size.width / 2.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //For Color
                          Text(
                            "Size",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: widget.eCommerceApp.size
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                final int index = entry.key;
                                final String size = entry.value;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedSizeIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10, top: 10),
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: selectedSizeIndex == index
                                          ? Colors.black
                                          : Colors.white,
                                      border: Border.all(
                                        color: selectedSizeIndex == index
                                            ? Colors.black
                                            : Colors.black12,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        size,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: selectedSizeIndex == index
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],

          ),
      
    );
  }
}
