import 'package:flutter/material.dart';
import 'package:hayat_care/features/home/presentation/view/widgets/home_top_articles_section.dart';
import '../../../../health/presentation/view/widgets/join_us_card.dart';
import '../widgets/home_top_doctors_section.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/home_appointment_card.dart';
import '../../../../health/presentation/view/widgets/donations_section.dart';
import '../widgets/home_header.dart';
import '../widgets/home_specialties_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: HomeHeader()),

            SliverToBoxAdapter(child: HomeSearchBar()),

            SliverToBoxAdapter(child: HomeAppointmentCard()),

            SliverToBoxAdapter(child: HomeSpecialtiesList()),

            SliverToBoxAdapter(child: HomeTopDoctorsSection()),

            SliverToBoxAdapter(child: JoinUsCard()),

            SliverToBoxAdapter(child: HomeTopArticlesSection()),

            SliverToBoxAdapter(child: DonationsSection()),

            SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      ),
    );
  }
}