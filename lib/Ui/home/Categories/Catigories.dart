
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Ui/home/Categories/Catigoriesproducts.dart';
import 'package:flutter_application_4/cubit/appcubit_cubit.dart';
import 'package:flutter_application_4/cubit/appcubit_state.dart';
import 'package:flutter_application_4/sheared/Constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Catigories extends StatelessWidget {
  const Catigories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Shopcupit, Shopstates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Catigories',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          body: ConditionalBuilder(
            condition: Shopcupit.get(context).categories != null,
            builder: (context) => ListView.separated(
                itemBuilder: (context, index) => CatiegoryItem(context, index),
                separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Container(
                        height: .8,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                itemCount: 5),
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  Padding CatiegoryItem(context, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      child: InkWell(
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
        child: Row(
          children: [
            Container(
                height: 130,
                width: 130,
                child: CachedNetworkImage(
                  imageUrl:
                      '${Shopcupit.get(context).categoryModel!.data.categories[index].image}', // Network image URL
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
            Text(
                Shopcupit.get(context)
                    .categoryModel!
                    .data
                    .categories[index]
                    .name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Spacer(),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
