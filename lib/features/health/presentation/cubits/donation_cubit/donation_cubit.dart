import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayat_care/core/enums/donation_fund_enum.dart';
import 'package:injectable/injectable.dart';
import 'package:hayat_care/features/health/domain/entities/donation_entity.dart';
import 'package:hayat_care/features/health/domain/use_cases/submit_donation_use_case.dart';

part 'donation_state.dart';

@injectable
class DonationCubit extends Cubit<DonationState> {
  final SubmitDonationUseCase _submitDonationUseCase;

  DonationCubit(this._submitDonationUseCase) : super(DonationInitial());

  DonationFundEnum? selectedFund;
  double? amount;

  void selectFund(DonationFundEnum fund) {
    selectedFund = fund;
  }

  void setAmount(double value) {
    amount = value;
  }

  Future<void> submitDonation({required String paymentMethod}) async {
    if (selectedFund == null || amount == null) return;

    emit(DonationLoading());
    try {
      await _submitDonationUseCase(
        DonationEntity(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          amount: amount!,
          fund: selectedFund!,
          paymentMethod: paymentMethod,
          createdAt: DateTime.now(),
        ),
      );
      emit(DonationSuccess());
    } catch (e) {
      emit(DonationError(e.toString()));
    }
  }
}