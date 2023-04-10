import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/data/remote/network_exceptions.dart';
import '../../data/model/req_model/change_pwd_params.dart';
import '../../data/model/req_model/profile_req_model.dart';
import '../../di/injection.dart';
import '../../domain/profile_repository.dart';

class ProfileInfoNotifier extends StateNotifier<AsyncValue> {
  ProfileInfoNotifier({required this.repo}) : super(const AsyncData('')) {
    getProfileInfo();
  }

  final ProfileRepository repo;

  Future<void> getProfileInfo() async {
    state = const AsyncLoading();
    final response = await repo.getUserProfile();
    response.when(success: (data) {
      state = AsyncData(data);
    }, failure: (error) {
      state = AsyncError(error as NetworkExceptions);
    });
  }
}

class ChangePasswordNotifier extends StateNotifier<AsyncValue> {
  final ProfileRepository repo;

  ChangePasswordNotifier({required this.repo}) : super(const AsyncData(''));

  // Future<void> changePassword(ChangePasswordParams params) async {
  //   state = const AsyncLoading();
  //   final response = await repo.changePassword(params);
  //   // response.when(success: (data) {
  //   //   state = AsyncData(data);
  //   // }, failure: (error) {
  //   //   state = AsyncError(error as NetworkExceptions);
  //   // });
  // }
}

// class UpdateProfileNotifier extends StateNotifier<AsyncValue> {
//   final ProfileRepository repo;
//   final Ref ref;

//   UpdateProfileNotifier({required this.repo, required this.ref})
//       : super(const AsyncData(''));

//   Future<void> updateProfile(ProfileUpdateReqParams params) async {
//     state = const AsyncLoading();
//     final response = await repo.updateProfile(params);
//     // response.when(success: (data) {
//     //   ref.read(profileInfoNotifier.notifier).getProfileInfo();
//     //   state = AsyncData(data);
//     // }, failure: (error) {
//     //   state = AsyncError(error as NetworkExceptions);
//     // });
//   }
// }

// class UpdateProfilePicNotifier extends StateNotifier<AsyncValue> {
//   final ProfileRepository repo;
//   final Ref ref;

//   UpdateProfilePicNotifier({required this.repo, required this.ref})
//       : super(const AsyncData(''));

//   Future<void> updateProfilePic(XFile file) async {
//     state = const AsyncLoading();
//     final response = await repo.updateProfilePic(file);
//     // response.when(success: (data) {
//     //   ref.read(profileInfoNotifier.notifier).getProfileInfo();
//     //   state = AsyncData(data);
//     // }, failure: (error) {
//     //   state = AsyncError(error as NetworkExceptions);
//     // });
//   }
// }
