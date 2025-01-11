import 'package:SHOPPING/core/Helpers/shearedprefrences/shearedPrefrences.dart';
import 'package:SHOPPING/features/Cart/cubit/cart_cubit.dart';
import 'package:SHOPPING/features/Home/cubit/home_cubit.dart';
import 'package:SHOPPING/features/Home/presentation/DetailedScreen.dart';
import 'package:SHOPPING/features/favorites/cubit/favorites_cubit.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:SHOPPING/core/models/Homemodel.dart';

Container ProductItem(List<Products> Allproducts, int index, context) {
  return Container(
    height: 255,
    
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailedScreen(
                      product: Allproducts[index],
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 206, 206, 206)),
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Stack(
                  
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                        height: 170,
                        width: 170,
                        child: CachedNetworkImage(
                          imageUrl: Allproducts[index].image!,
                          placeholder: (context, url) =>
                              Image.asset("assets/images/loaddd.jpg"),
                          fit: BoxFit.fill,
                        )),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                             decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: .5,
                                        blurRadius: 1)
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 24,
                              width: 24,
                            child: IconButton(
                              onPressed: () {
                                FavoritesCubit.get(context).AddAndRemoveFavorite(
                                    CashHelper.Getdata('token'),
                                    Allproducts[index].id!,
                                    context);
                              },
                              icon: Icon(
                                Icons.favorite_sharp,
                                color: HomeCubit.get(context)
                                            .Allproducts[index]
                                            .inFavorites ==
                                        true
                                    ? primarycolor
                                    : Colors.grey,
                              ),
                              color: Colors.white,
                              iconSize: 20,
                              padding: EdgeInsets.all(0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 115,
                        ),
                        GestureDetector(
                          onTap: (){
                             CartCubit.get(context).AddAndRemoveCart(Allproducts[index].id!,context);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: .50,
                                        blurRadius: 1)
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 24,
                              width: 24,
                              child: Center(child: Icon(Icons.shopping_cart,color:Allproducts[index].inCart!?primarycolor: Colors.grey ,),),),
                        )
                      ],
                    )
                  ],
                ),
                if (Allproducts[index].discount != 0)
                  Container(
                    color: primarycolor,
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
  );
}
