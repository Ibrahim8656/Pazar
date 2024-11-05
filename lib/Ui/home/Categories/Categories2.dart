import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/Ui/authentcation/Register.dart';
import 'package:flutter_application_4/Ui/home/Categories/Catigories.dart';
import 'package:flutter_application_4/Ui/home/Categories/Catigoriesproducts.dart';
import 'package:flutter_application_4/cubit/appcubit_cubit.dart';
import 'package:flutter_application_4/cubit/appcubit_state.dart';
import 'package:flutter_application_4/sheared/Constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories2 extends StatelessWidget {
  const Categories2({super.key});

  @override
  Widget build(BuildContext context) {
    var Cubit=Shopcupit.get(context);
    return BlocConsumer<Shopcupit, Shopstates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal:25 ),
          child: Scaffold(
            appBar: AppBar(title: Text("Catigories", style: TextStyle(fontWeight: FontWeight.bold)),),
            body: GridView.count(crossAxisCount: 2,
            shrinkWrap: true,
             crossAxisSpacing: 20,
              mainAxisSpacing: 1,
              childAspectRatio: 1 / 1.4,
            children:List.generate( Cubit
                              .categoryModel!
                              .data
                              .categories.length, (index)=>InkWell(
                                onTap: () {
          CatigoryIdd =
              Cubit.categoryModel!.data.categories[index].id;
          Cubit.GitProductsOfCatigory(CatigoryIdd);

          print(CatigoryIdd);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (Context) => Catigoriesproducts(
                        CatigoryId: Cubit
                            .categoryModel!
                            .data
                            .categories[index]
                            .id,
                      )));
        },
                                child: Column(children: [
                                   CachedNetworkImage(
                  imageUrl:
                      '${Cubit
                               .categoryModel!
                                .data
                                .categories[index].image}', // Network image URL
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
                                SizedBox(height: 15,),
                                Text( Cubit
                                .categoryModel!
                                .data
                                .categories[index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                                ],),
                              )),
            
            ),
          ),
        );
      },
    );
  }
}
