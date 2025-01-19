
import 'package:SHOPPING/features/categories/cubit/categories_cubit.dart';
import 'package:SHOPPING/features/categories/presentation/categorisdetailes_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoriesListview extends StatelessWidget {
  const CategoriesListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => InkWell(
         onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategorisdetailesScreen(CategoryId: CategoriesCubit.get(context).Categorys![index].id!,),
                            ),
                          );
                        },
        child: Column(
          children: [
            Container(height: MediaQuery.sizeOf(context).height*.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(imageUrl:CategoriesCubit.get(context).Categorys![index].image!,placeholder:(context, url) => Image.asset("assets/images/loaddd.jpg"), )
            ),
            Text(CategoriesCubit.get(context).Categorys![index].name!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      itemCount: CategoriesCubit.get(context).Categorys!
      .length,
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        width: MediaQuery.sizeOf(context).width*.020,
      ),
    );
  }
}
