import 'package:clothing_stores_ui/Model/app_model.dart';
import 'package:flutter/material.dart';

class CuratedItems extends StatelessWidget {
  final AppModel eCommerceItems;
  final Size size;
  const CuratedItems(
      {super.key, required this.eCommerceItems, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(255, 168, 197, 212),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(eCommerceItems.image),
            ),
          ),
          height: size.height * 0.25,
          width: size.width * 0.5,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.black26,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 7),
        
      ],
    );
  }
}
