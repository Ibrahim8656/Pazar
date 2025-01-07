  import 'package:SHOPPING/core/Helpers/shearedprefrences/shearedPrefrences.dart';
import 'package:SHOPPING/core/models/favorites_model.dart';
import 'package:SHOPPING/features/favorites/cubit/favorites_cubit.dart';
import 'package:SHOPPING/features/favorites/presentation/screens/detailed_favorites_Screens.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

InkWell favoritItembuilder(
      BuildContext context, int index, List<ProductDataa> FavProductList) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailedFavoritesScreens(product: FavProductList[index].product ,
              
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Row(
          children: [
            Container(
                height: 130,
                width: 130,
                child: CachedNetworkImage(
                  imageUrl:
                      '${FavProductList[index].product.image}', // Network image URL
                  placeholder: (context, url) => Image.asset(
                    "assets/images/loaddd.jpg", // Placeholder while loading
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.error), // Error widget
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              width: 15,
            ),
            Container(
              width: 160,
              child: Text(
                  FavProductList[index].product.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Spacer(),
            CircleAvatar(
              radius: 14,
              backgroundColor: Colors.red,
              child: IconButton(
                onPressed: () {
                   FavoritesCubit.get(context).AddAndRemoveFavorite(CashHelper.Getdata('token'),FavProductList[index].product.id,context);
                },
                icon: Icon(Icons.favorite_border),
                color: Colors.white,
                iconSize: 20,
                padding: EdgeInsets.all(0),
              ),
            ),
          ],
        ),
      ),
    );
  }
