// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../../core/data/remote/network_exceptions.dart';
// import '../../di/injection.dart';
// import '../../domain/otp_repository.dart';


// class RegisterOtpNotifier extends StateNotifier<AsyncValue> {
//   final OtpRepository _repository;

//   RegisterOtpNotifier(this._repository) : super(const AsyncData(''));

//   Future<void> sendOtpPhone(String number) async {
//     state = const AsyncLoading();
//     final response = await _repository.otpRegister(phone: number);
//     response.when(success: (data) {
//       state = AsyncData(data);
//     }, failure: (error) {
//       state = AsyncError(error as NetworkExceptions);
//     });
//   }
// }

// final registerSendOtpNotifier = StateNotifierProvider<RegisterOtpNotifier, AsyncValue>(
//         (ref) => RegisterOtpNotifier(ref.watch(otpRepositoryProvider)));


