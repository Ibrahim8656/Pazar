import 'package:SHOPPING/core/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:SHOPPING/core/models/Homemodel.dart';

SliverGrid buildproductsGrid(List<Products> Allproducts, context) {
  return SliverGrid.count(
    crossAxisCount: 2,
    crossAxisSpacing: 22,
    mainAxisSpacing: 22,
    childAspectRatio: 1 / 1.40,
    children: List.generate(
      Allproducts.length,
      (index) => ProductItem(Allproducts, index, context)),
  );
}
