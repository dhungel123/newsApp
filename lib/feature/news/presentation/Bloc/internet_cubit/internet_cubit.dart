import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState {
  initial,lost,gained
}
class InternetCubit extends Cubit<InternetState>{
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _subscription ;
  InternetCubit():super(InternetState.initial){
    _subscription = _connectivity.onConnectivityChanged.listen((result) {
      if( result == ConnectivityResult.mobile || result== ConnectivityResult.wifi){
        emit(InternetState.gained);
      }
      else
        {
          emit(InternetState.lost);
        }


    });
  }
  @override
  Future<void> close()async{
    _subscription?.cancel();
    return super.close();

  }




}