import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Ui/home/products/Deteals.dart';
import 'package:flutter_application_4/Ui/home/products/productdeteals.dart';
import 'package:flutter_application_4/cubit/appcubit_cubit.dart';
import 'package:flutter_application_4/cubit/appcubit_state.dart';
import 'package:flutter_application_4/model/Favoraitsmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favorits extends StatelessWidget {
  const Favorits({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Shopcupit, Shopstates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text('FAvorets'),
            ),
            body: ConditionalBuilder(
                condition: Shopcupit.get(context).FavProductList != [],
                builder: (context) => ListView.separated(
                    itemBuilder: (context, index) => favoritItembuilder(
                        context, index, Shopcupit.get(context).FavProductList),
                    separatorBuilder: (context, index) => Container(
                          height: .5,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                    itemCount: Shopcupit.get(context).FavProductList.length),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator())));
      },
    );
  }

  InkWell favoritItembuilder(
      BuildContext context, int index, List<ProductDataa> FavProductList) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Deteals(
              productIndex: index,
              products: Shopcupit.get(context).FavProductList,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Row(
          children: [
            Container(
                height: 130,
                width: 130,
                child: CachedNetworkImage(
                  imageUrl:
                      '${Shopcupit.get(context).FavProductList[index].product.image}', // Network image URL
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
            SizedBox(
              width: 15,
            ),
            Container(
              width: 160,
              child: Text(
                  Shopcupit.get(context).FavProductList[index].product.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Spacer(),
            CircleAvatar(
              radius: 14,
              backgroundColor: Colors.red,
              child: IconButton(
                onPressed: () {
                  Shopcupit.get(context).AddandRemoveFavorit(
                      Shopcupit.get(context).FavProductList[index].product.id);
                },
                icon: Icon(Icons.favorite_border),
                color: Colors.white,
                iconSize: 20,
                padding: EdgeInsets.all(0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
