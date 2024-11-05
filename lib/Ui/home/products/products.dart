import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Ui/home/products/productdeteals.dart';
import 'package:flutter_application_4/cubit/appcubit_cubit.dart';
import 'package:flutter_application_4/cubit/appcubit_state.dart';
import 'package:flutter_application_4/model/productmodle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Shopcupit()
        ..GitCatigories()
        ..gitProducts()
        ..GitFavoritsProducts(),
      child: BlocConsumer<Shopcupit, Shopstates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is lodingProductState) {
            // While loading, show the progress indicator
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is GetProductState) {
            // When data is loaded, show the actual content
            return Scaffold(
              body: Column(
                children: [
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20),
                        child: Text(
                          'Pazar',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 230,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            labelText: 'What are you looking for?',
                            labelStyle: TextStyle(fontSize: 15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (Shopcupit.get(context).productData != null)
                            Carouselslider(context),
                          SizedBox(height: 15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Categories',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          CategoryList(context),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Products',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                ProductsBuilder(
                                    Shopcupit.get(context).Allproducts,
                                    context),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            // If there's an error or unknown state, handle it here
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }

  CarouselSlider Carouselslider(BuildContext context) {
    return CarouselSlider(
      items: Shopcupit.get(context)
          .productData!
          .banners
          .map((e) => Image(
                image: NetworkImage('${e.image}'),
                width: double.infinity,
                fit: BoxFit.cover,
              ))
          .toList(),
      options: CarouselOptions(
        initialPage: 1,
        viewportFraction: 1,
        height: 250,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }

  Widget CategoryList(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Column(
          children: [
            Image(
              image:
                  NetworkImage(Shopcupit.get(context).categories![index].image),
              height: 150,
            ),
            Text(
              Shopcupit.get(context).categories![index].name,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        itemCount: Shopcupit.get(context).categories!.length,
      ),
    );
  }
}

Widget ProductsBuilder(List<ProductModel>? Allproducts, context) {
  return GridView.count(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    crossAxisCount: 2,
    crossAxisSpacing: 1,
    mainAxisSpacing: 1,
    childAspectRatio: 1 / 1.5,
    children: List.generate(
      Allproducts!.length,
      (index) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Productdeteals(
                productIndex: index,
                products: Allproducts,
              ),
            ),
          );
        },
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(Allproducts[index].image),
                  height: 170,
                ),
                Container(
                  color: Colors.red,
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
            Text(
              '${Allproducts[index].name}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('EGP'),
                Text(
                  '${Allproducts[index].price.toString()}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 14,
                  backgroundColor:
                      Shopcupit.get(context).favorits[Allproducts[index].id] ==
                              true
                          ? Colors.red
                          : Colors.grey,
                  child: IconButton(
                    onPressed: () {
                      Shopcupit.get(context)
                          .AddandRemoveFavorit(Allproducts[index].id);
                    },
                    icon: Icon(Icons.favorite_border),
                    color: Colors.white,
                    iconSize: 20,
                    padding: EdgeInsets.all(0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
