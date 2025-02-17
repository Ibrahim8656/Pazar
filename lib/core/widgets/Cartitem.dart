
import 'package:SHOPPING/core/Helpers/shearedprefrences/shearedPrefrences.dart';
import 'package:SHOPPING/core/models/cart_model.dart';
import 'package:SHOPPING/features/Cart/cubit/cart_cubit.dart';
import 'package:SHOPPING/features/Cart/presentation/detailedScreen.dart';
import 'package:SHOPPING/features/favorites/cubit/favorites_cubit.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartProduct,
    required this.index,
  });
  final int index;
  final List<CartItems> cartProduct;
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailedScreenCart(product:cartProduct[index] )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(spreadRadius: .4, blurRadius: 2, color: Colors.grey)
              ]),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).width*.3,
                    width: MediaQuery.sizeOf(context).width*.3,
                    padding: EdgeInsets.only(top: 10,left: 10),
                    child: CachedNetworkImage(
                      imageUrl:
                          '${cartProduct[index].product.image}', // Network image URL
                      placeholder: (context, url) => Image.asset(
                        "assets/images/loaddd.jpg", // Placeholder while loading
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error), // Error widget
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).height*.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cartProduct[index].product.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text('EGP'),
                            Text(
                              "${cartProduct[index].product.price}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "${cartProduct[index].product.oldPrice}",
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        Text('Get it Tomorrow',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Container(
                    height: MediaQuery.sizeOf(context).height*.040,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 226, 226, 226)),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          CartCubit.get(context)
                              .AddAndRemoveCart(cartProduct[index].product.id,context);
                        },
                        child: Text(
                          'Remove',
                          style: TextStyle(
                              fontSize: 15,
                              color: const Color.fromARGB(255, 148, 148, 148)),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: cartProduct[index].product.inFavorites
                              ? primarycolor
                              : const Color.fromARGB(255, 180, 180, 180),
                        ),
                        TextButton(
                          onPressed: () {
                            FavoritesCubit.get(context).AddAndRemoveFavorite(
                                CashHelper.Getdata("token"),
                                cartProduct[index].product.id,
                                context);
                          },
                          child: Text(
                            cartProduct[index].product.inFavorites
                                ? 'Remove from wishlist'
                                : 'Add to wishlist',
                            style: TextStyle(
                                fontSize: 15,
                                color: const Color.fromARGB(255, 148, 148, 148)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
