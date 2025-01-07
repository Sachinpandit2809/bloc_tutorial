import 'package:bloc_tutorial/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:bloc_tutorial/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_tutorial/bloc/post/post_bloc.dart';
import 'package:bloc_tutorial/bloc/switch_slider/switch_slider_bloc.dart';
import 'package:bloc_tutorial/bloc/todo/todo_bloc.dart';
import 'package:bloc_tutorial/repository/favourite_repositry.dart';
import 'package:bloc_tutorial/ui/counter_screen.dart';
import 'package:bloc_tutorial/ui/login_screen.dart';
import 'package:bloc_tutorial/utils/image_picker_utils.dart';
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
          // // creating this for local state management
          // BlocProvider<CounterBloc>(
          //   create: (context) => CounterBloc(),
          // ),
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
          home: LoginScreen(),
        ));
  }
}
