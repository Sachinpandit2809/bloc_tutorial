// import 'package:bloc_tutorial/bloc/counter/counter_bloc.dart';
// import 'package:bloc_tutorial/bloc/counter/counter_event.dart';
// import 'package:bloc_tutorial/bloc/counter/counter_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CounterScreen extends StatefulWidget {
//   const CounterScreen({super.key});

//   @override
//   State<CounterScreen> createState() => _CounterScreenState();
// }

// class _CounterScreenState extends State<CounterScreen> {
//   @override
//   Widget build(BuildContext context) {
//     print('CounterScreen: build');
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Counter'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           BlocBuilder<CounterBloc, CounterState>(

//             builder: (context, state) {
//               print('CounterScreen: $state');
//               return Text(
//                 state.counterValue.toString(),
//                 style: const TextStyle(fontSize: 48),
//               );
//             },
//           ),
//           const SizedBox(height: 30),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                   onPressed: () {
//                     context.read<CounterBloc>().add(IncrementCounter());
//                   },
//                   child: const Text('Increment')),
//               const SizedBox(width: 20),
//               ElevatedButton(
//                   onPressed: () {
//                     context.read<CounterBloc>().add(DecrementCounter());
//                   },
//                   child: const Text('Decrement')),
//             ],
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: () {}),
//     );
//   }
// }

import 'package:bloc_tutorial/bloc/counter/counter_bloc.dart';
import 'package:bloc_tutorial/bloc/counter/counter_event.dart';
import 'package:bloc_tutorial/bloc/counter/counter_state.dart';
import 'package:bloc_tutorial/ui/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late CounterBloc counterBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counterBloc = CounterBloc();
    counterBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    print('CounterScreen: build');
    return BlocProvider(
      create: (_) => counterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Counter'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PostScreen()));
              },
              icon: const Icon(Icons.read_more_rounded),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                debugPrint('CounterScreen: ${state.counterValue}');
                return Text(
                  state.counterValue.toString(),
                  style: const TextStyle(fontSize: 48),
                );
              },
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(IncrementCounter());
                      },
                      child: const Text('Increment'));
                }),
                const SizedBox(width: 20),
                BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(DecrementCounter());
                      },
                      child: const Text('Decrement'));
                }),
              ],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}
