import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:student_login_quik/core/db/models/db_model.dart';
import 'package:student_login_quik/domine/image_repo.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageRepo imagerepo;

  ImageBloc(this.imagerepo) : super(const ImageInitial()) {
    on<InitialEvent>((event, emit) {
      if (event.student == null) {
        emit(const ImageState(imagePath: null));
      } else {
        emit(ImageState(imagePath: event.student!.image));
      }
    });

    on<GetCameraImage>((event, emit) async {
      var imagePath = await imagerepo.pickImage();

      emit(ImageState(imagePath: imagePath));
    });
    on<GetGalleryImage>((event, emit) async {
      var imagePath = await imagerepo.pickImage(isCam: false);

      emit(ImageState(imagePath: imagePath));
    });
  }
}
