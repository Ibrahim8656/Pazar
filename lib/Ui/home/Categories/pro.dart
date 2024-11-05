import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Ui/home/Categories/Catigoriesproducts.dart';
import 'package:flutter_application_4/Ui/home/Favoritss.dart/favorits.dart';
import 'package:flutter_application_4/Ui/home/Search/Search.dart';
import 'package:flutter_application_4/Ui/home/products/productdeteals.dart';
import 'package:flutter_application_4/cubit/appcubit_cubit.dart';
import 'package:flutter_application_4/cubit/appcubit_state.dart';
import 'package:flutter_application_4/model/productmodle.dart';
import 'package:flutter_application_4/sheared/Constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pro extends StatelessWidget {
  const Pro({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Shopcupit, Shopstates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is lodingProductState) {
          // While loading, show the progress indicator
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (Shopcupit.get(context).productmodel != null &&
            Shopcupit.get(context).categoryModel != null) {
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
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Search()));
                      },
                      child: Container(
                          height: 35,
                          width: 230,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Icon(Icons.search),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Center(child: Text('What are you looking for?')),
                            ],
                          )),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Favorits()));
                      },
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
                                  Shopcupit.get(context).Allproducts, context),
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
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

CarouselSlider Carouselslider(BuildContext context) {
  return CarouselSlider(
    items: Shopcupit.get(context)
        .productData!
        .banners
        .map((e) => CachedNetworkImage(
              imageUrl: '${e.image}', // Network image URL
              placeholder: (context, url) => Image.asset(
                'Assets/images/animated_.gif', // Placeholder while loading
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error), // Error widget
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
          Container(
              height: 150,
              width: 150,
              child:InkWell(
                 onTap: () {
          CatigoryIdd =
              Shopcupit.get(context).categoryModel!.data.categories[index].id;
          Shopcupit.get(context).GitProductsOfCatigory(CatigoryIdd);

          print(CatigoryIdd);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (Context) => Catigoriesproducts(
                        CatigoryId: Shopcupit.get(context)
                            .categoryModel!
                            .data
                            .categories[index]
                            .id,
                      )));
        },
                child: CachedNetworkImage(
                  imageUrl:
                      '${Shopcupit.get(context).categories![index].image}', // Network image URL
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
              )),
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

Widget ProductsBuilder(List<ProductModel>? Allproducts, context) {
  return GridView.count(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    crossAxisCount: 2,
    crossAxisSpacing: 20,
    mainAxisSpacing: 1,
    childAspectRatio: 1 / 1.7,
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
                if (Allproducts[index].discount != 0)
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
               
                Container(
             
                  height: 33,
                  width: 27,
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                     color:  Shopcupit.get(context).inCart[Allproducts[index].id] ==
                              true
                          ? Colors.red
                          : Colors.grey,
                          
                     ),
                  child: IconButton(
                    onPressed: () {
                      Shopcupit.get(context)
                          .AddandRemoveCart(Allproducts[index].id);
                    },
                    icon: Icon(Icons.shopping_cart),
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
