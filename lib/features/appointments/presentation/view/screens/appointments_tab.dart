import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/enums/appointment_status_enum.dart';
import 'package:hayat_care/core/di/injection.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import '../../../../../gen/assets.gen.dart';
import '../../cubit/appointments_cubit.dart';
import '../widgets/appointments_list_section.dart';

class AppointmentsTab extends StatelessWidget {
  const AppointmentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (_) => sl<AppointmentsCubit>()..loadAppointments(),
      child: DefaultTabController(
        animationDuration: const Duration(milliseconds: 300),
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Assets.common.logoColored.svg(height: 36.h),
                SizedBox(width: 8.w),
                Text(
                  local.myAppointments,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.h),
              child: Builder(
                builder: (context) => TabBar(
                  onTap: (index) {
                    final status = AppointmentStatusEnum.values[index];
                    context.read<AppointmentsCubit>().loadAppointments(
                      status: status,
                    );
                  },
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  tabs: [
                    Tab(text: local.upcoming),
                    Tab(text: local.completed),
                    Tab(text: local.cancelled),
                  ],
                ),
              ),
            ),
          ),
          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              AppointmentsListSection(),
              AppointmentsListSection(),
              AppointmentsListSection(),
            ],
          ),
        ),
      ),
    );
  }
}
