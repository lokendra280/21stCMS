// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../../core/data/remote/network_exceptions.dart';
// import '../../data/model/req_params/registration_params.dart';
// import '../../di/injection.dart';
// import '../../domain/register_repository.dart';

// class LoginNotifier extends StateNotifier<AsyncValue> {
//   final RegisterRepository repository;

//   LoginNotifier(this.repository) : super(const AsyncData(''));

//   Future<void> registerUser(RegistrationParams params) async {
//     state = const AsyncLoading();
//     final response = await repository.registerUser(params);
//     response.when(success: (data) {
//       state = AsyncData(data);
//     }, failure: (error) {
//       state = AsyncError(error as NetworkExceptions);
//     });
//   }
// }

// final registerUserNotifier = StateNotifierProvider<LoginNotifier, AsyncValue>(
//     (ref) => LoginNotifier(ref.watch(registerRepositoryProvider)));


