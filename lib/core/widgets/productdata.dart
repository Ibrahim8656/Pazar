import 'package:SHOPPING/core/methods/showShoppingBottomsheet.dart';
import 'package:SHOPPING/features/Cart/cubit/cart_cubit.dart';
import 'package:SHOPPING/features/Home/presentation/DetailedScreen.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:flutter/material.dart';

class productdata extends StatelessWidget {
  const productdata({
    super.key,
    required this.widget,
  });

  final DetailedScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                 Text("${widget.product.description}",maxLines: 9,style: TextStyle(
                   fontSize: 14,fontWeight: FontWeight.bold,
                 ),),
                SizedBox(height: 30,),
                Row(children: [
                 Text("EGP"),
                  Text("${widget.product.price}",style: TextStyle(
                   fontSize: 18,fontWeight: FontWeight.bold,
                 ),),
                 Spacer(),
                 InkWell(onTap: (){
                    CartCubit.get(context).AddAndRemoveCart(
                       widget.product.id!, context);
                       showBottpmsheet(context,widget);
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
         );
  }
}
 