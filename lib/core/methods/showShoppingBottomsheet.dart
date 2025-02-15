import 'package:SHOPPING/features/Cart/cubit/cart_cubit.dart';
import 'package:SHOPPING/features/Cart/presentation/cart_Screen.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:SHOPPING/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> showBottpmsheet(BuildContext context, widget) {
  return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
            height: MediaQuery.sizeOf(context).height * .34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 28,
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 300,
                              child: Text(
                                "${widget.product.name}",
                                style: Styles.styleBold18,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )),
                          Text(
                            "Added Successfully",
                            style: Styles.style18.copyWith(color: Colors.green),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 221, 221, 221)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16),
                      child: BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          return Row(
                            children: [
                              Text(
                                "Cart Total",
                                style: Styles.styleBold18,
                              ),
                              Spacer(),
                              Text(
                                "EGP ${CartCubit.get(context).total}",
                                style: Styles.styleBold18,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1.2, color: primarycolor)),
                      child: Center(
                          child: Text(
                        "CONTINUE SHOPPING",
                        style: Styles.styleBold18.copyWith(color: primarycolor),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartScreen(
                                    Address: '',
                                  )));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primarycolor),
                      child: Center(
                          child: Text(
                        "View Cart",
                        style: Styles.styleBold18.copyWith(color: Colors.white),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ));
}
