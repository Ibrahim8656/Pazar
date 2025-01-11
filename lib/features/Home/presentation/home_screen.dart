import 'package:SHOPPING/core/widgets/CategoriesListview.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:SHOPPING/core/widgets/Custom_Row_appbar.dart';
import 'package:SHOPPING/core/widgets/product_grid.dart';
import 'package:SHOPPING/core/widgets/product_item.dart';
import 'package:SHOPPING/features/Home/cubit/home_cubit.dart';
import 'package:SHOPPING/core/widgets/Carouselslider.dart';
import 'package:SHOPPING/features/categories/cubit/categories_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is HomeDataSuccessState) {}
            },
          ),
        ],
        child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) => ConditionalBuilder(
                condition: (HomeCubit.get(context).Allproducts.length != 0),
                builder: (context) => Column(
                      children: [
                        SizedBox(height: 25),
                        CustomRowAppbar(product: HomeCubit.get(context).Allproducts,),
                        Expanded(
                          child: CustomScrollView(
                            slivers: [
                              SliverToBoxAdapter(
                                child: Buildcarouselslider(
                                    HomeCubit.get(context).data),
                              ),
                              SliverToBoxAdapter(
                                child: SizedBox(
                                  height: 300,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: ProductItem(
                                                HomeCubit.get(context)
                                                    .Allproducts,
                                                5,
                                                context)),
                                        SizedBox(width: 20),
                                        Expanded(
                                            child: ProductItem(
                                                HomeCubit.get(context)
                                                    .Allproducts,
                                                4,
                                                context)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              BlocBuilder<CategoriesCubit, CategoriesState>(
                                builder: (BuildContext context,
                                        CategoriesState state) =>
                                    SliverToBoxAdapter(
                                  child: SizedBox(
                                    height: 210,
                                    child: CategoriesListview(),
                                  ),
                                ),
                              ),
                               SliverToBoxAdapter(child: SizedBox(height: 20,)),
                              HomeCubit.get(context).Allproducts.isNotEmpty
                                  ? buildproductsGrid(
                                      
                                      Allproducts: HomeCubit.get(context).Allproducts,context: context)
                                  : SliverToBoxAdapter(
                                      child: Center(
                                          child:
                                              Text("No products available"))),
                            ],
                          ),
                        ),
                      ],
                    ),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator(
                      color: primarycolor,
                    )))));
  }
}
