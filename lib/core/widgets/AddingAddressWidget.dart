import 'package:SHOPPING/features/location/presentation/location_screen.dart';
import 'package:SHOPPING/utils/decorations/colors.dart';
import 'package:SHOPPING/utils/styles.dart';
import 'package:flutter/material.dart';

class AddingAddressWidget extends StatelessWidget {
  const AddingAddressWidget({
    super.key, required this.Address,
  });
  final String Address;
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen()));
    },
      child: Padding(
        padding: const EdgeInsets.only(left: 22.0, right: 22, bottom: 10),
        child: Container(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Icon(
                  Icons.location_pin,color: primarycolor,
                  size: 28,
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(width: MediaQuery.sizeOf(context).width*.6,
                  child: Text(Address ==''?
                    "Add Your Address":Address,
                    style: Styles.style18
                        .copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,),
                ),Spacer(),
                Icon(Icons.arrow_drop_down,size: 28,color: primarycolor,)
              ],
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 214, 214, 214)),
        ),
      ),
    );
  }
}
