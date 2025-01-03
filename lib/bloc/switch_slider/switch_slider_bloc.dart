import 'package:bloc_tutorial/bloc/switch_slider/switch_slider_event.dart';
import 'package:bloc_tutorial/bloc/switch_slider/switch_slider_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchSliderBloc extends Bloc<SwitchSliderEvent, SwitchSliderState> {
  SwitchSliderBloc() : super(SwitchSliderState()) {
    on<EnableOrDisableNotification>(_onEnableOrDisableNotification);
    on<SliderEvent>(_onSliderEvent);
  }
  void _onEnableOrDisableNotification(
      EnableOrDisableNotification event, Emitter<SwitchSliderState> sac) {
    sac(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _onSliderEvent(SliderEvent event, Emitter<SwitchSliderState> sac) {
    sac(state.copyWith(slider: event.slider));
  }
}
