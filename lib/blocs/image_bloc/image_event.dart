part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}

class InitialEvent extends ImageEvent {
  final StudentModel? student;

  InitialEvent({this.student});
}

class GetCameraImage extends ImageEvent {}

class GetGalleryImage extends ImageEvent {}
