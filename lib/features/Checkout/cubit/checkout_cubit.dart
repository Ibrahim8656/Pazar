
import 'package:SHOPPING/features/Checkout/data/PaymentRepository/paymentRepository.dart';
import 'package:SHOPPING/features/Checkout/data/Stripe_models/payment_intent_input_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.paymentRepository) : super(CheckoutInitial());
  final Paymentrepository paymentRepository;

  static CheckoutCubit get(context) => BlocProvider.of(context);

  Future<void> makePayment({
    required  PaymentIntentInputModell paymentintent,
  }) async {
    emit(CheckoutLoading());
    try {
      final data = await paymentRepository.Makepayment(
      paymentintent: paymentintent
      );
      data.fold(
        (l) => emit(CheckoutError(l.Error)),
        (r) => emit(CheckoutSuccess())
      );
    } catch (error) {
      emit(CheckoutError(error.toString()));
    }
  }
}