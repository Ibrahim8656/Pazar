import 'package:flutter/material.dart';
import 'package:SHOPPING/features/categories/cubit/categories_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {
      
      },
      builder: (context, state) {
     final  Category= CategoriesCubit.get(context).Categorys;
  return  
         Scaffold(
          body:
          Category !=null ?
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 22,
                            mainAxisSpacing: 22,
                            childAspectRatio: 1 / 1.3,
                            children: List.generate(
                              Category!.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  // Add navigation logic here if necessary
                                },
                                child: Container(
                                   decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                  child: Container(
                                     
                                      decoration: BoxDecoration(
                                         color: Colors.white,
                                         
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                    child: Column(
                                      children: [
                                        Stack(
                                          alignment: AlignmentDirectional.bottomStart,
                                          children: [
                                            Container(
                                              height: 170,
                                              width: 160,
                                              child: Image(
                                                image: NetworkImage(Category[index].image!),fit: BoxFit.fill,
                                              ),
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
                                        Column(children: [
                                          SizedBox(height: 20,),
                                          Text(
                                          '${Category[index].name}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                                    
                                        ],)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
          ): Container(child: CircularProgressIndicator()),);

  } ,
        );
      }
    
  }

