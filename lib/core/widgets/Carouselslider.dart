import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:SHOPPING/core/models/Homemodel.dart';

class Buildcarouselslider extends StatelessWidget {
  const Buildcarouselslider(
    this.banners, {
    super.key,
  });
  final List<Banners>? banners;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: banners!.length != []
          ? banners!
              .map(
                (e) => CachedNetworkImage(
                  imageUrl: "${e.image}",
                  placeholder: (context, url) =>
                      Image.asset("assets/images/loaddd.jpg"),
                      fit: BoxFit.cover,
                      width: double.infinity,
                ),
                
              )
              .toList()
          : [],
      options: CarouselOptions(
        initialPage: 1,
        viewportFraction: 1,
        height: 250,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }
}
