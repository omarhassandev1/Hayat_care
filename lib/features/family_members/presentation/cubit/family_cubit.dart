import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/family_member_entity.dart';
import '../../domain/use_cases/add_family_member.dart';
import '../../domain/use_cases/delete_family_member.dart';
import '../../domain/use_cases/get_family_members.dart';
import '../../../family_members/presentation/cubit/familt_state.dart';

@injectable
class FamilyCubit extends Cubit<FamilyState> {
  final GetFamilyMembersUseCase getFamilyMembersUseCase;
  final AddFamilyMemberUseCase addFamilyMemberUseCase;
  final DeleteFamilyMemberUseCase deleteFamilyMemberUseCase;

  FamilyCubit({required this.getFamilyMembersUseCase, required this.addFamilyMemberUseCase, required this.deleteFamilyMemberUseCase}) : super(FamilyInitial());


  Future<void> loadMembers() async {
    emit(FamilyLoading());
    try {
      final members = await getFamilyMembersUseCase();
      emit(FamilyLoaded(members));
    } catch (e) {
      emit(FamilyError("Something went wrong"));
    }
  }
  
  Future<void> addMember(FamilyMemberEntity member) async {
    emit(FamilyLoading());
    try {
      await addFamilyMemberUseCase.call(member);
      await loadMembers();
    } catch (e) {
      emit(FamilyError("Failed to add member"));
    }
  }

  Future<void> removeMember(String nationalId) async {
    await deleteFamilyMemberUseCase(nationalId);
    loadMembers();
  }
}