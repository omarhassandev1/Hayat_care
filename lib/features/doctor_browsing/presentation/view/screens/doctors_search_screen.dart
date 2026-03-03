import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/enums/doctor_specialty_enum.dart';
import 'package:hayat_care/localization/app_localizations.dart';
import '../../../../../core/di/injection.dart';
import '../../cubit/doctors_cubit.dart';
import '../widgets/doctors_filter_section.dart';
import '../widgets/doctors_list_section.dart';

class DoctorsSearchScreen extends StatefulWidget {
  final DoctorSpecialtyEnum? initialSpecialty;
  final bool? isSearching;

  const DoctorsSearchScreen({super.key, this.initialSpecialty, this.isSearching=true});

  @override
  State<DoctorsSearchScreen> createState() => _DoctorsSearchScreenState();
}

class _DoctorsSearchScreenState extends State<DoctorsSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool isSearching = true;

  @override
  void initState() {
    super.initState();
    isSearching = (widget.initialSpecialty == null && widget.isSearching==true);

    if (isSearching) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<DoctorsCubit>()..loadDoctors(specialty: widget.initialSpecialty),
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: isSearching
                ? TextField(
                    controller: _searchController,
                    focusNode: _focusNode,
                    style: Theme.of(context).textTheme.labelMedium,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.findDoctors,
                      border: InputBorder.none,
                      hintStyle: Theme.of(
                        context,
                      ).textTheme.labelMedium?.copyWith(color: Colors.grey),
                    ),
                    onChanged: (query) {
                      context.read<DoctorsCubit>().searchDoctors(query);
                    },
                  )
                : Text(
                    AppLocalizations.of(context)!.doctors,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
            actions: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSearching) {
                      _focusNode.unfocus();
                      _searchController.clear();
                      context.read<DoctorsCubit>().searchDoctors('');
                      isSearching = false;
                    } else {
                      _focusNode.requestFocus();
                      isSearching = true;
                    }
                  });
                },
                child: Icon(
                  isSearching ? Icons.close : Icons.search,
                  size: 26.r,
                ),
              ),
              SizedBox(width: 16.w),
            ],
          ),
          body: Column(
            children: [
              SizedBox(height: 16.h),
              DoctorsFilterSection(),
              SizedBox(height: 16.h),
              Expanded(child: DoctorsListSection()),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
