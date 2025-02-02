
import 'package:SHOPPING/features/Cart/cubit/cart_cubit.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:SHOPPING/core/models/favorites_model.dart';


  class DetailedFavoritesScreens extends StatefulWidget {
  const DetailedFavoritesScreens({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  State<DetailedFavoritesScreens> createState() => _DetailedFavoritesScreens();
}

class _DetailedFavoritesScreens extends State<DetailedFavoritesScreens> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25,top: 50),
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
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all( 25),
              child: CachedNetworkImage(
                 imageUrl: widget.product.image,
                 placeholder: (context, url) =>
                     Image.asset("assets/images/loaddd.jpg"),
                 fit: BoxFit.contain,
                 width: double.infinity,
               ),
            ),
          ),
           Container(
            width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        
                      )
                    ],
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all( 25),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("${widget.product.name}",style: TextStyle(
                          fontSize: 20,fontWeight: FontWeight.bold,
                        ),maxLines: 2,),
                        SizedBox(height: 15,),
                        Text("description",style: TextStyle(
                          fontSize: 20,fontWeight: FontWeight.bold,
                        )),
                        Text("${widget.product.description}",maxLines: 10,style: TextStyle(
                          fontSize: 14,fontWeight: FontWeight.bold,
                        ),),
                       SizedBox(height: 30,),
                       Row(children: [
                        Text("EGP"),
                         Text("${widget.product.price}",maxLines: 8,style: TextStyle(
                          fontSize: 18,fontWeight: FontWeight.bold,
                        ),),
                        Spacer(),
                        InkWell(onTap: (){
                           CartCubit.get(context).AddAndRemoveCart(
                              widget.product.id, context);
                        },
                          child: Container(height:  60,
                          width: MediaQuery.sizeOf(context).width*.55,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Icon(Icons.shopping_bag,color: Colors.white,size: 26,),
                              SizedBox(width: 10,),
                              Text("Add to cart",style: TextStyle(
                                color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22
                              ),)
                            ],),
                          ),
                          decoration: BoxDecoration(
                            color: primarycolor,
                            borderRadius: BorderRadius.circular(30)
                          ),),
                        )
                       ],)
           
                        
                      ],),
                    ),
                  ),
                )
         ,
        
        ],
      ),
      
    );
  }
}
