import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:SHOPPING/core/models/Homemodel.dart';

SliverGrid buildproductsGrid(List<Products> Allproducts) {
  return SliverGrid.count(
    crossAxisCount: 2,
    crossAxisSpacing: 22,
    mainAxisSpacing: 22,
    childAspectRatio: 1 / 1.40,
    children: List.generate(
      Allproducts.length,
      (index) => GestureDetector(
        onTap: () {
          // Add navigation logic here if necessary
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Container(
                      height: 170,
                      width: 160,
                      child: CachedNetworkImage(
                        imageUrl: Allproducts[index].image!,
                        placeholder: (context, url) =>
                            Image.asset("assets/images/loaddd.jpg"),
                            
                      ),
                    ),
                    if (Allproducts[index].discount != 0)
                      Container(
                        color: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          child: Text(
                            'Discount',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 12, top: 12, right: 12),
                  child: Column(
                    children: [
                      Text(
                        '${Allproducts[index].name}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('EGP'),
                          Text(
                            '${Allproducts[index].price.toString()}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
