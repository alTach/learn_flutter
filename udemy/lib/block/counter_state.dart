//
// import 'package:equatable/equatable.dart';
//
// abstract class CounterState extends Equatable {
//   const CounterState();
//
//   @override
//   List<Object> get props => [];
// }
//
// class CounterInitialState extends CounterState {}
// class CounterLoadingState extends CounterState {}
// class CounterLoadedState extends CounterState {
//   int counter;
//
//   CounterLoadedState({required this.counter});
//
//   @override
//   List<Object> get props => [counter];
// }

part of 'counter_bloc.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState.initial() = _CounterInitialState;
  const factory CounterState.loading() = _CounterLoadingState;
  const factory CounterState.loaded({required int counter}) = _CounterLoadedState;
}
