import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/enums/appointment_status_enum.dart';
import 'package:hayat_care/core/di/injection.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import '../../../../../gen/assets.gen.dart';
import '../../cubit/appointments_cubit.dart';
import '../widgets/appointments_list_section.dart';

class AppointmentsTab extends StatefulWidget {
  const AppointmentsTab({super.key});

  @override
  State<AppointmentsTab> createState() => _AppointmentsTabState();
}

class _AppointmentsTabState extends State<AppointmentsTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late AppointmentsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = sl<AppointmentsCubit>()..loadAppointments();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        Future.delayed(const Duration(milliseconds: 100), () {
          final status = AppointmentStatusEnum.values[_tabController.index];
          _cubit.loadAppointments(status: status);
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return BlocProvider.value(
      value: _cubit,
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
            child: TabBar(
              controller: _tabController,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: local.upcoming),
                Tab(text: local.completed),
                Tab(text: local.cancelled),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          physics: const BouncingScrollPhysics(),
          children: const [
            AppointmentsListSection(),
            AppointmentsListSection(),
            AppointmentsListSection(),
          ],
        ),
      ),
    );
  }
}