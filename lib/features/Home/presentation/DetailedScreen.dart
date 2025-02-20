import 'package:SHOPPING/core/models/Homemodel.dart';
import 'package:SHOPPING/core/widgets/productdata.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetailedScreen extends StatefulWidget {
  const DetailedScreen({
    super.key,
    required this.product,
  });
  final Products product;

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
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
                    items: widget.product.images != null
                        ? widget.product.images!
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
                    children: widget.product.images != null
                        ? List.generate(
                            widget.product.images!.length,
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
           productdata(widget: widget)
         ,
        
        ],
      ),
      
    );
  }
}

