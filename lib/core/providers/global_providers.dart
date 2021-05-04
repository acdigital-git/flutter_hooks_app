import 'package:flutter_hooks_app/core/models/result_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appLoadingStateProvider = StateProvider.autoDispose<bool>((ref) => false);

final appErrorStateNotifier =
    StateNotifierProvider.autoDispose<AppErrorStateNotifier, ResultItem?>(
        (ref) => AppErrorStateNotifier());

class AppErrorStateNotifier extends StateNotifier<ResultItem?> {
  AppErrorStateNotifier({ResultItem? item}) : super(item ?? null);

  void successMessage(String _message) =>
      state = ResultItem(isError: false, message: _message);

  void errorMessage(String _message) =>
      state = ResultItem(isError: true, message: _message);

  void reset() => state = null;
}
