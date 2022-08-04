
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:day8/main.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
  void reset() => emit(0);
  void multiply() => emit(state*2);
  void division() => emit(state~/ 2);

}

// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class CounterCubit extends Cubit<int> {
//   CounterCubit() : super(0);
//
//   void decrement() {
//     emit(state - 1);
//   void decrement() {
//     emit (state - 1);
//   }
//   }
// }