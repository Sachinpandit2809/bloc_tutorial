import 'package:bloc_tutorial/bloc/counter/counter_bloc.dart';
import 'package:bloc_tutorial/ui/counter_screen.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
          title: 'Bloc Tutorial',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: CounterScreen()),
    );
  }
}

class Equatable_testing extends StatelessWidget {
  const Equatable_testing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Person p1 = Person(name: 'Johkn', age: 30);
          Person p2 = Person(name: 'John', age: 30);
          print(p1 == p2);
          print(p1.hashCode);
          print(p2.hashCode);
        },
      ),
    );
  }
}

// class Person {
//   final String name;
//   final int age;

//   const Person({required this.name, required this.age});
//   @override
//   bool operator ==(Object other) {
//     // TODO: implement ==
//     return identical(this, other) ||
//         other is Person &&
//             runtimeType == other.runtimeType &&
//             name == other.name &&
//             age == other.age;
//   }

//   @override
//   // TODO: implement hashCode
//   int get hashCode => name.hashCode ^ age.hashCode;
// }

class Person extends Equatable {
  final String name;
  final int age;

  const Person({required this.name, required this.age});

  @override
// inside the array we have to pass the properties that we want to compare
  List<Object?> get props => [name, age];
}
