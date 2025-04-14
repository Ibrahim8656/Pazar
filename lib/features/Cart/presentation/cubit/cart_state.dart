part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
class GetCartLoadingState extends CartState{}
class GetCartSuccessState extends CartState{
  final List<CartItems> cartlist;

  GetCartSuccessState(this.cartlist);
}
class GetCartErrorState extends CartState{
  final String error;

  GetCartErrorState(this.error);
}
class AddAndRemoveCartLoading extends CartState{}
class AddAndRemoveCartSuccess extends CartState{
 final Addandremovecartmoder addandremovecartmoder;

  AddAndRemoveCartSuccess(this.addandremovecartmoder);
}
class AddAndRemoveCartError extends CartState{}

