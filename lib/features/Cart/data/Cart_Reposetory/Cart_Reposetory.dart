import 'package:SHOPPING/core/models/cart_model.dart';
import 'package:SHOPPING/core/models/AddAndRemoveCartmoder.dart';
import 'package:SHOPPING/features/Cart/data/Cart_callservice/Cart_callservice.dart';

class CartReposetory {
  final CartCallservice cartCallservice;

  CartReposetory(this.cartCallservice);
   Future<CartModel>GetCart()async{
    final cartproducts= await cartCallservice.GetCart();
    CartModel cartModel=CartModel.fromJson(cartproducts);
    return cartModel;
   }
     Future<Addandremovecartmoder>AddAndRemoveCart(int product_id)async{
      final response=await cartCallservice.AddAndRemoveCart(product_id);
       Addandremovecartmoder addandremovecartmoder=Addandremovecartmoder.fromJson(response);
       return addandremovecartmoder;
     }
}