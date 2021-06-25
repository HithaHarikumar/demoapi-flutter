

import 'package:demolistapi/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductTile extends StatelessWidget {
  final Images images;
  const ProductTile(this.images);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  // child: Image.network(
                  //   images.color!,
                  //   fit: BoxFit.cover,
                  // ),
                ),
                // Positioned(
                //   right: 0,
                //   child: Obx(() => CircleAvatar(
                //     backgroundColor: Colors.white,
                //     child:
                //
                //
                //     // IconButton(
                //     //   icon: images.height!
                //     //       ? Icon(Icons.favorite_rounded)
                //     //       : Icon(Icons.favorite_border),
                //     //   onPressed: () {
                //     //     images.isFavorite.toggle();
                //     //   },
                //     // ),
                //   )),
                // )
              ],
            ),
            SizedBox(height: 8),
            Text(
              images.id!,
              maxLines: 2,
              style:
              TextStyle( fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            if (images.likes != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      images.categories.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            SizedBox(height: 8),
            Text('\$${images.likes}',
                style: TextStyle(fontSize: 32)),
          ],
        ),
      ),
    );
  }
}