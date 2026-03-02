import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubit/appointments_cubit.dart';
import '../../cubit/appointments_state.dart';
import 'appointment_card.dart';

class AppointmentsListSection extends StatelessWidget {
  const AppointmentsListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentsCubit, AppointmentsState>(
      builder: (context, state) {
        if (state is AppointmentsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is AppointmentsEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_today_outlined,
                    size: 64.r, color: Colors.grey),
                SizedBox(height: 16.h),
                Text(
                  'No appointments found',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        if (state is AppointmentsLoadSuccess) {
          return ListView.builder(
            padding:
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            itemCount: state.appointments.length,
            itemBuilder: (context, index) {
              return AppointmentCard(
                appointmentWithDoctor: state.appointments[index],
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}