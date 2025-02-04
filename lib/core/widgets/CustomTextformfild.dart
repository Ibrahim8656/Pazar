import 'package:SHOPPING/features/Home/cubit/home_cubit.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.searchedPrudect,
  });

  final TextEditingController searchedPrudect;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: primarycolor, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        hintText: "What are you looking for?",
        fillColor: const Color.fromARGB(255, 245, 245, 245),
        filled: true,
      ),
      controller: searchedPrudect,
      onChanged: (searchedPrudect) {
        HomeCubit.get(context).Search(searchedPrudect);
      },
    );
  }
}
