import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/features/profile/presentation/view/screens/add_family_member_screen.dart';
import 'package:hayat_care/features/profile/presentation/view/widgets/family_member_card.dart';
import 'package:hayat_care/localization/app_localizations.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/widgets/custom_main_button.dart';
import '../../cubit/familt_state.dart';
import '../../cubit/family_cubit.dart';
import '../widgets/no_family_members_widget.dart';

class FamilyMembersScreen extends StatelessWidget {
  const FamilyMembersScreen({super.key});

  static const String routeName = 'familyMembersScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FamilyCubit>()..loadMembers(),
      child: _FamilyMembersView(), // افصل الـ UI في widget منفصلة
    );
  }
}

class _FamilyMembersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.family,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 24.sp),
        ),
      ),
      body: BlocBuilder<FamilyCubit, FamilyState>(
        builder: (context, state) {
          if (state is FamilyLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FamilyLoaded) {
            if (state.members.isEmpty) {
              return NoFamilyMembersWidget();
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          FamilyMemberCard(member: state.members[index]),
                      separatorBuilder: (context, index) => SizedBox(height: 15),
                      itemCount: state.members.length,
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0.h),
                      child: Row(
                        children: [
                          CustomMainButton(
                            label: AppLocalizations.of(context)!.addFamilyMember,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                    value: context.read<FamilyCubit>(),
                                    child: const AddFamilyMemberScreen(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}