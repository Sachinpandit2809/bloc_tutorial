import 'package:equatable/equatable.dart';

class SwitchSliderState extends Equatable {
  bool isSwitch;
  double slider;
  SwitchSliderState({this.isSwitch = false, this.slider = 1.0});

  SwitchSliderState copyWith({bool? isSwitch, double? slider}) {
    return SwitchSliderState(
        isSwitch: isSwitch ?? this.isSwitch, slider: slider ?? this.slider);
  }

  @override
  List<Object> get props => [isSwitch, slider];
}
