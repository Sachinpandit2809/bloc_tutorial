import 'package:bloc_tutorial/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_tutorial/bloc/image_picker/image_picker_state.dart';
import 'package:bloc_tutorial/utils/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  // creating the variable
  final ImagePickerUtils _imagePickerUtils;
  // injecting the dependencies

  ImagePickerBloc(this._imagePickerUtils) : super(ImagePickerState()) {
    on<PickImageFromGallery>(_onPickImageFromGallery);
  }
  void _onPickImageFromGallery(
      PickImageFromGallery event, Emitter<ImagePickerState> emit) async {
    final XFile? file = await _imagePickerUtils.GalleryPicker();
    emit(state.copyWith(file: file));
  }
}
