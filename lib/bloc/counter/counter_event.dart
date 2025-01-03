

import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  // helps to feature and behavier of the sub classes 

  const CounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementCounter extends CounterEvent {} 
class DecrementCounter extends CounterEvent {}