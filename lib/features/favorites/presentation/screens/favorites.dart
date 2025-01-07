
import 'package:SHOPPING/core/widgets/FavoriteItem.dart';
import 'package:SHOPPING/features/favorites/cubit/favorites_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
       final favorites=FavoritesCubit.get(context).favoriteslist;
        return Scaffold(
            appBar: AppBar(
              title: Text('FAvorets'),
            ),
            body: ConditionalBuilder(
                condition: favorites.length!= 0,
                builder: (context) => ListView.separated(
                    itemBuilder: (context, index) => favoritItembuilder(
                        context, index,favorites),
                    separatorBuilder: (context, index) => Container(
                          height: .5,
                          width: double.infinity,
                          color: Colors.grey,
                        ),
                    itemCount: favorites.length),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator(),),),);
      },
    );
  }
}
