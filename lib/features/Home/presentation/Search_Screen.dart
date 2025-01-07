import 'package:SHOPPING/core/models/Homemodel.dart';
import 'package:SHOPPING/core/widgets/Custom_Row_appbar.dart';
import 'package:SHOPPING/core/widgets/product_grid.dart';
import 'package:SHOPPING/core/widgets/product_item.dart';
import 'package:SHOPPING/features/Home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  const Search({super.key, required this.product});
  final List<Products> product;

  @override
  Widget build(BuildContext context) {
    TextEditingController searchedPrudect = TextEditingController();
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Padding(
              padding: const EdgeInsets.only(top: 100, left: 25,right: 25),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder()
                    ),
                    controller: searchedPrudect,
                    onChanged: (searchedPrudect) {
                      HomeCubit.get(context).Search(searchedPrudect);
                    },
                  ),
                 State is!  shearshingState 
                      ? Expanded(
                        child: ListView.builder(
                            itemBuilder: (context, index) => ProductItem(
                                HomeCubit.get(context).SearchProductList,
                                index,
                                context),
                            itemCount: HomeCubit.get(context).SearchProductList.length,
                          ),
                      )
                      : Center(
                          child: Text("search for needed prouduct"),
                        ),
                ],
              ),
            );
        },
      ),
    );
  }
}
