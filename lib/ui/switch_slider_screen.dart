import 'package:bloc_tutorial/bloc/switch_slider/switch_slider_bloc.dart';
import 'package:bloc_tutorial/bloc/switch_slider/switch_slider_event.dart';
import 'package:bloc_tutorial/bloc/switch_slider/switch_slider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchSliderScreen extends StatefulWidget {
  const SwitchSliderScreen({super.key});

  @override
  State<SwitchSliderScreen> createState() => _SwitchSliderScreenState();
}

class _SwitchSliderScreenState extends State<SwitchSliderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch and Slider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notification '),
                BlocBuilder<SwitchSliderBloc, SwitchSliderState>(
                    buildWhen: (previous, current) =>
                        previous.isSwitch != current.isSwitch,
                    builder: (context, state) {
                      debugPrint('Switch:');

                      return Switch(
                        activeColor: Colors.green,
                        value: state.isSwitch,
                        onChanged: (value) {
                          context
                              .read<SwitchSliderBloc>()
                              .add((EnableOrDisableNotification()));
                          debugPrint('Switch: $value');
                        },
                      );
                    }),
              ],
            ),
            BlocBuilder<SwitchSliderBloc, SwitchSliderState>(
                buildWhen: (previous, current) =>
                    previous.slider != current.slider,
                builder: (context, state) {
                  return Container(
                      child: Center(child: Text(' ${state.slider}')),
                      height: 200,
                      color: Colors.red.withOpacity(state.slider));
                }),
            BlocBuilder<SwitchSliderBloc, SwitchSliderState>(
                buildWhen: (previous, current) =>
                    previous.slider != current.slider,
                builder: (context, state) {
                  return Slider(
                    value: state.slider,
                    onChanged: (value) {
                      context
                          .read<SwitchSliderBloc>()
                          .add(SliderEvent(slider: value));
                      debugPrint('Slider: $value');
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
