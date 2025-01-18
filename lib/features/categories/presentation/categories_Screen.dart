import 'package:SHOPPING/features/categories/presentation/categorisdetailes_screen.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:SHOPPING/features/categories/cubit/categories_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {},
      builder: (context, state) {
        final Category = CategoriesCubit.get(context).Categorys;
        return Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.category,color: primarycolor,),
            title: Text("Categories"),
            backgroundColor: Colors.white,
          ),
          body: Category != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 22,
                    mainAxisSpacing: 22,
                    childAspectRatio: 1 / 1.3,
                    children: List.generate(
                      Category.length,
                      (index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategorisdetailesScreen(CategoryId: Category[index].id!,),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.bottomStart,
                                  children: [
                                    Container(
                                      height: MediaQuery.sizeOf(context).height*.2,
                                      width:  MediaQuery.sizeOf(context).width*.4,
                                      child: CachedNetworkImage(
                                        imageUrl: Category[index].image!,
                                        fit: BoxFit.fill,
                                        placeholder: (context, url) =>
                                            Image.asset(
                                                "assets/images/loaddd.jpg"),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      '${Category[index].name}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
