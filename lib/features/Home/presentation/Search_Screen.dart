import 'package:SHOPPING/core/models/Homemodel.dart';
import 'package:SHOPPING/core/widgets/CustomTextformfild.dart';
import 'package:SHOPPING/core/widgets/product_item.dart';
import 'package:SHOPPING/features/Home/cubit/home_cubit.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
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
            padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Search",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: primarycolor),
                ),
                SizedBox(
                  height: 8,
                ),
             TextFormFieldWidget(searchedPrudect: searchedPrudect),
  State is! shearshingState
                    ? Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => ProductItem(
                              HomeCubit.get(context).SearchProductList,
                              index,
                              context),
                          itemCount:
                              HomeCubit.get(context).SearchProductList.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            height: 20,
                          ),
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

