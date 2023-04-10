import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/data/models/result_state.dart';
import '../../../../core/data/remote/api_endpoints.dart';
import '../../../../core/data/remote/api_result.dart';
import '../../../../core/data/remote/network_exceptions.dart';
import '../../../profile/di/injection.dart';
import '../../data/model/req_params/login_params.dart';
import '../../di/injection.dart';
import '../../domain/login_repository.dart';
import '../widgets/social_sign_up.dart';

class LoginNotifier extends StateNotifier<ResultState> {
  final LoginRepository _loginRepository;
  final Ref ref;

  LoginNotifier(this.ref, this._loginRepository) : super(const Idle());

  Future<void> login(LoginParams params) async {
    state = const Loading();
    final response = await _loginRepository.loginUser(params);
    response.when(success: (data) {
      ref.read(authProvider).authorize();
      ref
          .read(profileInfoNotifier.notifier)
          .getProfileInfo(); //fetch profile on login
      // ref.read(cartCountNotifier.notifier).fetchCartCount();
    }, failure: (error) {
      state = Error(error: error as NetworkExceptions);
    });
  }
}

final loginProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, ResultState>(
        (ref) => LoginNotifier(ref, ref.watch(loginRepositoryProvider)));
