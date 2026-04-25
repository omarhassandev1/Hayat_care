import 'package:hayat_care/core/enums/donation_fund_enum.dart';

class DonationEntity {
  final String id;
  final double amount;
  final DonationFundEnum fund;
  final String paymentMethod;
  final DateTime createdAt;

  const DonationEntity({
    required this.id,
    required this.amount,
    required this.fund,
    required this.paymentMethod,
    required this.createdAt,
  });
}