import 'package:SHOPPING/core/Helpers/shearedprefrences/shearedPrefrences.dart';
import 'package:SHOPPING/core/models/Homemodel.dart';
import 'package:SHOPPING/core/widgets/productdata.dart';
import 'package:SHOPPING/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Detailedscreen extends StatelessWidget {
  const Detailedscreen({super.key, required this.product, required this.index});
  final Products product;
  final int index;
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 50),
                    child: CircleAvatar(
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          
                          Navigator.pop(context);
                        },
                      ),
                      radius: 25,
                      backgroundColor: primarycolor,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0,right: 20),
                    child: Container( 
                     decoration: BoxDecoration(
                       color: const Color.fromARGB(255, 238, 238, 238),
                      borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite,size: 30,
                            color:(product.inFavorites==true&&FavoritesCubit.get(context).isfave==true)? primarycolor:Colors.white,
                          ),
                          onPressed: () {
                            FavoritesCubit.get(context).AddAndRemoveFavorite(
                                CashHelper.Getdata('token'), product.id!, context,FavoritesCubit.get(context).isfave?false:true);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      // Carousel Slider
                      CarouselSlider(
                        items: product.images != null
                            ? product.images!
                                .map(
                                  (e) => CachedNetworkImage(
                                    imageUrl: "$e",
                                    placeholder: (context, url) =>
                                        Image.asset("assets/images/loaddd.jpg"),
                                    fit: BoxFit.contain,
                                    width: double.infinity,
                                  ),
                                )
                                .toList()
                            : [],
                        options: CarouselOptions(
                          initialPage: 0,
                          viewportFraction: 1,
                          height: MediaQuery.sizeOf(context).height * .3,
                          reverse: false,
                          autoPlay: false,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            _currentIndex = index;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: product.images != null
                            ? List.generate(
                                product.images!.length,
                                (index) => AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  width: _currentIndex == index ? 12 : 8,
                                  height: _currentIndex == index ? 12 : 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _currentIndex == index
                                        ? primarycolor
                                        : Colors.grey,
                                  ),
                                ),
                              )
                            : [],
                      ),
                    ],
                  ),
                ),
              ),
              productdata(product: product)
            ],
          ),
        );
      },
    );
  }

 
}

