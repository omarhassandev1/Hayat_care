part of 'donation_cubit.dart';

abstract class DonationState {}

class DonationInitial extends DonationState {}

class DonationLoading extends DonationState {}

class DonationSuccess extends DonationState {}

class DonationError extends DonationState {
  final String message;
  DonationError(this.message);
}