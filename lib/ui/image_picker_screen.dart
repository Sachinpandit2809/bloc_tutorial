import 'dart:io';

import 'package:bloc_tutorial/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_tutorial/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_tutorial/bloc/image_picker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image Picker Bloc"),
        ),
        body: Center(
          child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
              builder: (context, state) {
            if (state.file == null) {
              return GestureDetector(
                onTap: () {
                  context.read<ImagePickerBloc>().add(PickImageFromGallery());
                },
                child: CircleAvatar(
                  child: Icon(Icons.camera_alt_sharp),
                ),
              );
            } else {
              // return Image.file(File(state.file!.path.toString()));
              return Image(
                height: 300,
                width: 200,
                fit: BoxFit.cover,
                
                image: FileImage(File(state.file!.path.toString())),
              );
            }
          }),
        ));
  }
}
