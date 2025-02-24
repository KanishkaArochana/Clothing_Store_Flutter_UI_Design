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
            Text(eCommerceItems.rating.toString()),
            Text(
              "(${eCommerceItems.review})",
              style: const TextStyle(
                color: Colors.black26,
              ),
            ),
          ],
        ),
        SizedBox(
          width: size.width * 0.5,
          child: Text(
            eCommerceItems.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ),
        Row(
          children: [
            Text(
              "\$${eCommerceItems.price.toString()}.00",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.red,
                height: 1.5,
              ),
            ),
            SizedBox(width: 5),
            if (eCommerceItems.isCheck == true)
              Text(
                "\$${eCommerceItems.price + 255}.00",
                style: TextStyle(
                  color: Colors.black26,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Colors.black26,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
