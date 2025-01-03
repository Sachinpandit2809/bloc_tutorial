import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SwitchSliderEvent extends Equatable {
  SwitchSliderEvent();

  @override
  List<Object> get props => [];
}

class EnableOrDisableNotification extends SwitchSliderEvent {}

class SliderEvent extends SwitchSliderEvent {
  double slider;
  SliderEvent({required this.slider});
  List<Object> get props => [slider];
}
