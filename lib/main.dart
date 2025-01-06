import 'package:bloc_tutorial/bloc/counter/counter_bloc.dart';
import 'package:bloc_tutorial/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:bloc_tutorial/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_tutorial/bloc/post/post_bloc.dart';
import 'package:bloc_tutorial/bloc/switch_slider/switch_slider_bloc.dart';
import 'package:bloc_tutorial/bloc/todo/todo_bloc.dart';
import 'package:bloc_tutorial/repository/favourite_repositry.dart';
import 'package:bloc_tutorial/ui/favourite_app_screen.dart';
import 'package:bloc_tutorial/ui/image_picker_screen.dart';
import 'package:bloc_tutorial/ui/post_screen.dart';
import 'package:bloc_tutorial/ui/switch_slider_screen.dart';
import 'package:bloc_tutorial/ui/todo_screen.dart';
import 'package:bloc_tutorial/utils/image_picker_utils.dart';
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
    return MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(
            create: (context) => CounterBloc(),
          ),
          BlocProvider<SwitchSliderBloc>(
            create: (_) => SwitchSliderBloc(),
          ),
          BlocProvider<ImagePickerBloc>(
            create: (_) => ImagePickerBloc(ImagePickerUtils()),
          ),
          BlocProvider<TodoBloc>(
            create: (_) => TodoBloc(),
          ),
          BlocProvider<FavouriteAppBloc>(
            create: (_) => FavouriteAppBloc(FavouriteRepositry()),
          ), 
          BlocProvider<PostBloc>(
            create: (_) => PostBloc(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bloc Tutorial',
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            brightness: Brightness.dark,
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: PostScreen(),
        ));
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
