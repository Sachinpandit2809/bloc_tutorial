import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int counterValue;
  const CounterState({this.counterValue = 10});

  CounterState copyWith({int? countervalue}) {
    return CounterState(counterValue: countervalue ?? this.counterValue);
  }

  @override
  List<Object> get props => [counterValue];
}

final class CounterInitial extends CounterState {}
