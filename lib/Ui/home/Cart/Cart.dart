import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Ui/home/Favoritss.dart/favorits.dart';
import 'package:flutter_application_4/Ui/home/products/Deteals.dart';
import 'package:flutter_application_4/Ui/home/products/productdeteals.dart';
import 'package:flutter_application_4/cubit/appcubit_cubit.dart';
import 'package:flutter_application_4/cubit/appcubit_state.dart';
import 'package:flutter_application_4/model/Cartmodel.dart';
import 'package:flutter_application_4/model/Favoraitsmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
     
    return BlocConsumer<Shopcupit, Shopstates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
       
        if (Shopcupit.get(context).CartProductList.length != 0) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Cart',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Favorits()));
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            body: ConditionalBuilder(
              condition: Shopcupit.get(context).favoritesResponse != null,
              builder: (context) => ListView.separated(
                  itemBuilder: (context, index) => favoritItembuilder(
                      context, index, Shopcupit.get(context).CartProductList),
                  separatorBuilder: (context, index) => Container(
                        height: .5,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                  itemCount: Shopcupit.get(context).CartProductList.length),
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
            bottomSheet: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                   color: Colors.red,
                  borderRadius: BorderRadius.circular(10)
                ),
                height: 60,
               
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  
                  child: Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                     [
                      Text("${Shopcupit.get(context).CartProductList.length} item",style: TextStyle(color: Colors.white,),),
                     
                      Text("EGP ${Shopcupit.get(context).GitTotalcost(Shopcupit.get(context).CartProductList)}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                    ],),
                 SizedBox(width: 40,), Text("CHECKOUT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                 Spacer(),
                 IconButton(icon:Icon(Icons.arrow_forward_sharp,color: Colors.white,),onPressed: (){},)
                  
                  ],),
                ),
              ),
            ),
          );
        } else
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Cart',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Favorits()));
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      size: 30,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            body: Center(child: Image.asset("Assets/images/cart.png")),
          );
      },
    );
  }

  Padding favoritItembuilder(
      BuildContext context, int index, List<CartItem> CartProductList) {
    var product = Shopcupit.get(context).CartProductList[index].product;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 130,
                width: 130,
                child: CachedNetworkImage(
                  imageUrl:
                      '${Shopcupit.get(context).CartProductList[index].product.image}', // Network image URL
                  placeholder: (context, url) => Image.asset(
                    'Assets/images/animated_.gif', // Placeholder while loading
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
                width: 160,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('EGP'),
                        Text(
                          "${product.price}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "${product.oldPrice}",
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
              Container(
                height: 35,
                decoration: BoxDecoration(color: Colors.white),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Shopcupit.get(context).AddandRemoveCart(product.id);
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
                      color: Shopcupit.get(context).favorits[
                                  CartProductList[index].product.id] ==
                              true
                          ? Colors.red
                          : const Color.fromARGB(255, 180, 180, 180),
                    ),
                    TextButton(
                      onPressed: () {
                        Shopcupit.get(context).AddandRemoveFavorit(product.id);
                      },
                      child: Text(
                        'Add to wishlist',
                        style: TextStyle(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 148, 148, 148)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
