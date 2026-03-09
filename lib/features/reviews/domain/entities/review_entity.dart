class ReviewEntity {
  final String id;
  final String doctorId;
  final String patientName;
  final String patientImageUrl;
  final int rating;
  final String comment;
  final bool wouldRecommend;
  final DateTime createdAt;

  const ReviewEntity({
    required this.id,
    required this.doctorId,
    required this.patientName,
    required this.patientImageUrl,
    required this.rating,
    required this.comment,
    required this.wouldRecommend,
    required this.createdAt,
  });
}