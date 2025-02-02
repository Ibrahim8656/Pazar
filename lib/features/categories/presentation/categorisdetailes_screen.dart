import 'package:SHOPPING/core/models/Homemodel.dart';
import 'package:SHOPPING/core/widgets/product_grid.dart';
import 'package:SHOPPING/features/Home/cubit/home_cubit.dart';
import 'package:SHOPPING/features/categories/cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategorisdetailesScreen extends StatelessWidget {
  const CategorisdetailesScreen({super.key, required this.CategoryId});
  final int CategoryId;

  @override
  Widget build(BuildContext context) {
    CategoriesCubit.get(context).GetCategoriesDetails(CategoryId);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Category Details"),
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          List<Products> CategoryProductList = [];

          if (state is GetCategoriesDetailsCuccessState) {
            CategoryProductList = state.categorisdetailedmodel.data?.data ?? [];
          }

          return Skeletonizer(
              enabled: state
                  is! GetCategoriesDetailsCuccessState, // Enable skeleton when loading
              child: CategoryProductList.isNotEmpty
                  ? CustomScrollView(
                      slivers: [
                        buildproductsGrid(
                          Allproducts: CategoryProductList,
                          context: context,
                        ),
                      ],
                    )
                  : BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        return CustomScrollView(
                          slivers: [
                            buildproductsGrid(
                              Allproducts: HomeCubit.get(context).Allproducts,
                              context: context,
                            ),
                          ],
                        );
                      },
                    ));
        },
      ),
    );
  }
}
