
import 'package:flutter/material.dart';
import 'package:flutter_application_4/features/Home/cubit/home_cubit.dart';
import 'package:flutter_application_4/features/authentication/presentation/widgets/Carouselslider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Productsscreen extends StatelessWidget {
  const Productsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeDataSuccessState) {
        // Update Allproducts when data is fetched
        }
      },
      builder: (context, state) {
       final Allproducts= HomeCubit.get(context).Allproducts;
        return state is HomeDataLoadingState
            ? Center(child: CircularProgressIndicator()) // Show loading while fetching data
            : Scaffold(
              backgroundColor:const Color.fromARGB(255, 221, 221, 221),
                body: CustomScrollView(
                  slivers: [
                    // Wrap CarouselSlider inside SliverToBoxAdapter
                    SliverToBoxAdapter(
                      child: Buildcarouselslider(), // Add your carousel here
                    ),
                   Allproducts!.isNotEmpty
                        ? SliverGrid.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 22,
                            mainAxisSpacing: 22,
                            childAspectRatio: 1 / 1.40,
                            children: List.generate(
                              Allproducts.length,
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
                                                image: NetworkImage(Allproducts[index].image!),fit: BoxFit.fill,
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
                                        Container(
                                          margin: EdgeInsets.only(left: 12,top: 12,right: 12),
                                          child: Column(children: [
                                            Text(
                                            '${Allproducts[index].name}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text('EGP'),
                                              Text(
                                                '${Allproducts[index].price.toString()}',
                                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                          ],),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SliverToBoxAdapter(child: Center(child: Text("No products available"))),
                  ],
                ),
              );
      },
    );
  }
}
