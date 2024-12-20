import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/features/Home/cubit/home_cubit.dart';

class Buildcarouselslider extends StatelessWidget {
  const Buildcarouselslider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: HomeCubit.get(context).data!.banners!
          .map((e) => Image(
                image: NetworkImage('${e.image}'),
                width: double.infinity,
                fit: BoxFit.cover,
              ))
          .toList(),
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
