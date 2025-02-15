import 'package:SHOPPING/core/methods/showShoppingBottomsheet.dart';
import 'package:SHOPPING/core/models/cart_model.dart';
import 'package:SHOPPING/core/widgets/productdata.dart';
import 'package:SHOPPING/features/Cart/cubit/cart_cubit.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetailedScreenCart extends StatefulWidget {
  const DetailedScreenCart({
    super.key,
    required this.product,
  });
  final CartItems product;

  @override
  State<DetailedScreenCart> createState() => _DetailedScreenCart();
}

class _DetailedScreenCart extends State<DetailedScreenCart> {
  int _currentIndex = 0; // To track the active image index

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
              child: Column(
                children: [
                  // Carousel Slider
                  CarouselSlider(
                    items: widget.product.product.images != null
                        ? widget.product.product.images!
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
                        setState(() {
                          _currentIndex = index; 
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.product.product.images != null
                        ? List.generate(
                            widget.product.product.images!.length,
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
                 Text("${widget.product.product.name}",style: TextStyle(
                   fontSize: 20,fontWeight: FontWeight.bold,
                 ),maxLines: 2,),
                 SizedBox(height: 15,),
                 Text("description",style: TextStyle(
                   fontSize: 20,fontWeight: FontWeight.bold,
                 )),
                 Text("${widget.product.product.description}",maxLines: 9,style: TextStyle(
                   fontSize: 14,fontWeight: FontWeight.bold,
                 ),),
                SizedBox(height: 30,),
                Row(children: [
                 Text("EGP"),
                  Text("${widget.product.product.price}",style: TextStyle(
                   fontSize: 18,fontWeight: FontWeight.bold,
                 ),),
                 Spacer(),
                 InkWell(onTap: (){
                    CartCubit.get(context).AddAndRemoveCart(
                       widget.product.id!, context);
                       
                       widget.product.product.inCart?showBottpmsheet(context,widget.product):null;
                 },
                   child: Container(height:  60,
                   width: MediaQuery.sizeOf(context).width*.55,
                   child: Center(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                       Icon(Icons.shopping_bag,color: Colors.white,size: 26,),
                       SizedBox(width: 10,),
                       Text( "Add to cart",style: TextStyle(
                         color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20
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

