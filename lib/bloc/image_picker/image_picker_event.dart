import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable {
  ImagePickerEvent();
  List<Object> get props => [];
}

class PickImageFromCamara extends ImagePickerEvent {}

class PickImageFromGallery extends ImagePickerEvent {}
