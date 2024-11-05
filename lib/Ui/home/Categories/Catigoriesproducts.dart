import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Ui/home/products/productdeteals.dart';
import 'package:flutter_application_4/cubit/appcubit_cubit.dart';
import 'package:flutter_application_4/cubit/appcubit_state.dart';
import 'package:flutter_application_4/sheared/Constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Catigoriesproducts extends StatelessWidget {
  const Catigoriesproducts({super.key, required this.CatigoryId});
  final CatigoryId;
  @override
  Widget build(BuildContext context) {
    CatigoryIdd = CatigoryId;
    return BlocProvider(
      create: (context) => Shopcupit()..GitProductsOfCatigory(CatigoryId),
      child: BlocConsumer<Shopcupit, Shopstates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Skeletonizer(
              enabled: state is lODINGGitProductsOfCatigorystate,
              child: Gridbuilder(context));
        },
      ),
    );
  }

  Scaffold Gridbuilder(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pazar',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 50,
          mainAxisSpacing: 1,
          childAspectRatio: 1 / 1.5,
          children: List.generate(
            Shopcupit.get(context).productsofCatigory.length,
            (index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Productdeteals(
                      productIndex: index,
                      products: Shopcupit.get(context).productsofCatigory,
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Productdeteals(
                                        productIndex: index,
                                        products: Shopcupit.get(context)
                                            .productsofCatigory,
                                      )));
                        },
                        child: Container(
                            height: 150,
                            width: 150,
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${Shopcupit.get(context).productsofCatigory[index].image}', // Network image URL
                              placeholder: (context, url) => Image.asset(
                                'Assets/images/animated_.gif', // Placeholder while loading
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error), // Error widget
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )),
                      ),
                      if (Shopcupit.get(context)
                              .productsofCatigory[index]
                              .discount !=
                          0)
                        Container(
                          color: Colors.red,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Text(
                              'Discount',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Text(
                    '${Shopcupit.get(context).productsofCatigory[index].name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('EGP'),
                      Text(
                        '${Shopcupit.get(context).productsofCatigory[index].price.toString()}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Container(
                        height: 33,
                        width: 27,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Shopcupit.get(context)
                                      .productsofCatigory[index]
                                      .id ==
                                  true
                              ? Colors.red
                              : Colors.grey,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Shopcupit.get(context).AddandRemoveCart(
                                Shopcupit.get(context)
                                    .productsofCatigory[index]
                                    .id);
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
        ),
      ),
    );
  }
}
