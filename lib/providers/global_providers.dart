import 'package:flutter_hooks_app/models/result_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appLoadingStateProvider = StateProvider<bool>((ref) => false);

final appErrorStateProvider = StateProvider<ResultItem?>((ref) => null);

final appErrorStateNotifier =
    StateNotifierProvider<AppErrorStateNotifier, ResultItem?>(
        (ref) => AppErrorStateNotifier());

class AppErrorStateNotifier extends StateNotifier<ResultItem?> {
  AppErrorStateNotifier({ResultItem? item}) : super(item ?? null);

  void successMessage(String _message) =>
      state = ResultItem(isError: false, message: _message);

  void errorMessage(String _message) =>
      state = ResultItem(isError: false, message: _message);
}
