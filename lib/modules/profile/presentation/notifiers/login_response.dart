import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/data/remote/network_exceptions.dart';
import '../../domain/login_repository.dart';

class LoginInfoNotifier extends StateNotifier<AsyncValue> {
  LoginInfoNotifier({required this.repo}) : super(const AsyncData('')) {
    getloginsInfo();
  }

  final loginRepo repo;

  Future<void> getloginsInfo() async {
    state = const AsyncLoading();
    final response = await repo.getlogininfo();
    response.when(success: (data) {
      state = AsyncData(data);
    }, failure: (error) {
      state = AsyncError(error as NetworkExceptions);
    });
  }
}
