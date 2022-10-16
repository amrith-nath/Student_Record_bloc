part of 'image_bloc.dart';

@immutable
class ImageState {
  final String? imagePath;

  const ImageState({required this.imagePath});
}

class ImageInitial extends ImageState {
  const ImageInitial() : super(imagePath: null);
}
