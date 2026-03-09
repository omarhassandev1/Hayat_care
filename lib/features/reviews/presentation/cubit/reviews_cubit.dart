import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hayat_care/features/reviews/presentation/cubit/reviews_state.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/review_entity.dart';
import '../../domain/use_cases/get_doctor_reviews_use_case.dart';
import '../../domain/use_cases/submit_review_use_case.dart';


@injectable
class ReviewsCubit extends Cubit<ReviewsState> {
  final GetDoctorReviewsUseCase _getReviews;
  final SubmitReviewUseCase _submitReview;

  ReviewsCubit(this._getReviews, this._submitReview) : super(ReviewsInitial());

  Future<void> loadReviews(String doctorId) async {
    emit(ReviewsLoading());
    try {
      final reviews = await _getReviews(doctorId);
      emit(ReviewsLoaded(reviews));
    } catch (e) {
      emit(ReviewsError(e.toString()));
    }
  }

  Future<void> submitReview(ReviewEntity review) async {
    emit(ReviewSubmitting());
    try {
      await _submitReview(review);
      emit(ReviewSubmitSuccess());
    } catch (e) {
      emit(ReviewSubmitError(e.toString()));
    }
  }
}