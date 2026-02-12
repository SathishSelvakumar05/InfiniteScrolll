import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'connectivity_state.dart';



class ConnectivityCubit extends Cubit<ConnectivityState> {
  final Connectivity _connectivity;
  StreamSubscription? _subscription;

  ConnectivityCubit(this._connectivity)
      : super(ConnectivityInitial()) {
    _init();
  }

  void _init() async {
    final result = await _connectivity.checkConnectivity();
    _emitStatus(result);

    _subscription =
        _connectivity.onConnectivityChanged.listen(_emitStatus);
  }

  void _emitStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      emit(ConnectivityOffline());
    } else {
      emit(ConnectivityOnline());
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
