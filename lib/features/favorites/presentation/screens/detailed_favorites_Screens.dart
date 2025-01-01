import 'package:flutter/material.dart';
import 'package:SHOPPING/core/models/favorites_model.dart';
import 'package:SHOPPING/core/widgets/defualt_buttom.dart';

class DetailedFavoritesScreens extends StatelessWidget {
  const DetailedFavoritesScreens({super.key, });
  //final Product product;
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                          ))
                    ],
                  ),
                ),
                Container(
                  height: 35,
                  width: 260,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: 'what are you looking for?',
                        labelStyle: TextStyle(fontSize: 15),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 300,
                  child: Text(
                    // products[productIndex].name,
                    "proudct nama",
                    maxLines: null,
                    softWrap: true,
                  ),
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Image(
                  image: AssetImage("assets/images/Frame.png"
                  //  products[productIndex].image,
                  ),
                  height: 350,
                  width: 300,
                ),
                Column(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          // color: Shopcupit.get(context).favorits[products[productIndex].id] ==
                          //     true
                          // ? Colors.red
                          // : Colors.grey,
                          // borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,  
                                blurRadius: 1,
                                offset: Offset(0, 3))
                          ]),
                      child: IconButton(
                        onPressed: () {

                      // Shopcupit.get(context)
                      //     .AddandRemoveFavorit(products[productIndex].id);
                        },
                        icon: Icon(Icons.favorite_border),
                        color: Colors.white,
                        iconSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0, 3))
                          ]),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.share_sharp),
                        color: Colors.grey,
                        iconSize: 25,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EGP',
                ),
                Text(
                  "product price",
                 // '${products[productIndex].price.toString()}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Only 2 left in the stock ',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 200,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 1,
                            spreadRadius: .5,
                            offset: Offset(0, 0))
                      ]),
                  height: 49,
                  width: 55,
                  child: Column(
                    children: [
                      Text('QUN'),
                      Text(
                        '1',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                defbotton(textt: 'Add to card', onpressed: () {}, width: 250),
              ],
            ),
          ],
        ),
      ),
    );
  }
}