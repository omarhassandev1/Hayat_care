import 'package:injectable/injectable.dart';
import '../../domain/entities/review_entity.dart';

@lazySingleton
class ReviewsMockDatasource {
  final List<ReviewEntity> _reviews = [
    ReviewEntity(
      id: 'r1',
      doctorId: '1', // Dr. Ahmed Sami
      patientName: 'Lauralee Quintero',
      patientImageUrl:
      'https://img.freepik.com/free-photo/woman-with-beautiful-gladiolus-flowers_23-2149441357.jpg',
      rating: 5,
      comment:
      'Dr. Ahmed was very professional and attentive. He explained everything clearly and made me feel comfortable during the visit.',
      wouldRecommend: true,
      createdAt: DateTime(2025, 3, 1),
    ),
    ReviewEntity(
      id: 'r2',
      doctorId: '1', // Dr. Ahmed Sami
      patientName: 'Marcus Johnson',
      patientImageUrl:
      'https://img.freepik.com/free-photo/portrait-smiling-man_23-2148670031.jpg',
      rating: 4,
      comment:
      'Great experience overall. Very knowledgeable doctor, waiting time was a bit long though.',
      wouldRecommend: true,
      createdAt: DateTime(2025, 2, 20),
    ),
    ReviewEntity(
      id: 'r3',
      doctorId: '2', // Dr. Lina Hassan
      patientName: 'Sara Ali',
      patientImageUrl:
      'https://img.freepik.com/free-photo/portrait-young-woman_23-2148670045.jpg',
      rating: 3,
      comment: 'Good doctor but the clinic was a bit crowded.',
      wouldRecommend: false,
      createdAt: DateTime(2025, 2, 10),
    ),
    ReviewEntity(
      id: 'r4',
      doctorId: '3', // Dr. Omar Khaled
      patientName: 'Lauralee Quintero',
      patientImageUrl:
      'https://img.freepik.com/free-photo/woman-with-beautiful-gladiolus-flowers_23-2149441357.jpg',
      rating: 5,
      comment: 'Absolutely wonderful doctor. Highly recommend!',
      wouldRecommend: true,
      createdAt: DateTime(2025, 1, 15),
    ),
    ReviewEntity(
      id: 'r5',
      doctorId: '3', // Dr. Omar Khaled
      patientName: 'Marcus Johnson',
      patientImageUrl:
      'https://img.freepik.com/free-photo/portrait-smiling-man_23-2148670031.jpg',
      rating: 4,
      comment: 'Very skilled surgeon. Recovery went smoothly.',
      wouldRecommend: true,
      createdAt: DateTime(2025, 1, 20),
    ),
    ReviewEntity(
      id: 'r6',
      doctorId: '5', // Dr. Ahmed Ali
      patientName: 'Sara Ali',
      patientImageUrl:
      'https://img.freepik.com/free-photo/portrait-young-woman_23-2148670045.jpg',
      rating: 5,
      comment: 'Amazing with kids! My son was not scared at all.',
      wouldRecommend: true,
      createdAt: DateTime(2025, 3, 5),
    ),
    ReviewEntity(
      id: 'r7',
      doctorId: '10', // Dr. Dina Sameh
      patientName: 'Lauralee Quintero',
      patientImageUrl:
      'https://img.freepik.com/free-photo/woman-with-beautiful-gladiolus-flowers_23-2149441357.jpg',
      rating: 5,
      comment: 'Best cardiologist I have ever visited. Very thorough.',
      wouldRecommend: true,
      createdAt: DateTime(2025, 2, 28),
    ),
    ReviewEntity(
      id: 'r8',
      doctorId: '17', // Dr. Mahmoud Fawzi
      patientName: 'Marcus Johnson',
      patientImageUrl:
      'https://img.freepik.com/free-photo/portrait-smiling-man_23-2148670031.jpg',
      rating: 5,
      comment: 'Veteran doctor with exceptional knowledge. Highly recommended.',
      wouldRecommend: true,
      createdAt: DateTime(2025, 3, 3),
    ),
  ];

  Future<List<ReviewEntity>> getDoctorReviews(String doctorId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _reviews.where((r) => r.doctorId == doctorId).toList();
  }

  Future<void> submitReview(ReviewEntity review) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _reviews.add(review);
  }
}