import 'package:SHOPPING/core/models/cart_model.dart';
import 'package:SHOPPING/core/widgets/AddAndRemoveCartmoder.dart';
import 'package:SHOPPING/features/Cart/data/Cart_Reposetory/Cart_Reposetory.dart';
import 'package:SHOPPING/features/Home/cubit/home_cubit.dart';
import 'package:SHOPPING/features/favorites/cubit/favorites_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartReposetory cartReposetory;
  CartCubit(this.cartReposetory) : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  List<CartItems> cartproducts = [];
  Future<void> GetCart() async {
    emit(GetCartLoadingState());
    try {
      final response = await cartReposetory.GetCart();
      cartproducts = response.data!.cartItems!;
      emit(
        GetCartSuccessState(cartproducts),
      );
    } catch (error) {
      print(
        error.toString(),
      );
      emit(
        GetCartErrorState(
          error.toString(),
        ),
      );
    }
  }
  Future<void>AddAndRemoveCart(int product_id,context)async{
    emit(AddAndRemoveCartLoading());
    try{
     final response=await cartReposetory.AddAndRemoveCart(product_id);
     print(response.message);
     HomeCubit.get(context)..GetHomedata();
     GetCart();
     emit(AddAndRemoveCartSuccess(response));
    }catch(error){
      print(error.toString());
      emit(AddAndRemoveCartError());
    }
  }
  
  
}
