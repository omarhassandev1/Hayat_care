import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/family_member_entity.dart';
import '../../domain/usecases/add_family_member.dart';
import '../../domain/usecases/delete_family_member.dart';
import '../../domain/usecases/get_family_members.dart';
import 'familt_state.dart';

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
    await addFamilyMemberUseCase.call(member);
    loadMembers();
  }

  Future<void> removeMember(String nationalId) async {
    await deleteFamilyMemberUseCase(nationalId);
    loadMembers();
  }
}