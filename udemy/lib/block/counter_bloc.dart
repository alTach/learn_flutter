import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_bloc.freezed.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBlock extends Bloc<CounterEvent,CounterState> {

  CounterBlock() : super(CounterState.initial()) {
    on<CounterStartEvent>((event, emit) async {
    await Future.delayed(const Duration(milliseconds: 5000));
      emit(CounterState.loaded(counter: 0));
    });
    on<CounterResetEvent>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 1500));
      emit(CounterState.loaded(counter: 0));
    });
    on<CounterIncrementEvent>((event, emit) async {
      if (state is _CounterLoadedState) {
        final counter = (state as _CounterLoadedState).counter;
        emit(CounterState.loading());
        await Future.delayed(const Duration(milliseconds: 500));
        emit(CounterState.loaded(counter: counter + 1));
      }
    });
  }
}
