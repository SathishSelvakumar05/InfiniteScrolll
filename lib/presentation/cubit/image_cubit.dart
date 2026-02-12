import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/image_models.dart';
import '../../data/repositories/image_repository.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  final ImageRepository repository;

  int page = 1;
  final int limit = 15;
  bool isFetching = false;

  ImageCubit(this.repository) : super(ImageInitial());

  Future<void> fetchImages({bool isRefresh = false}) async {
    if (isFetching) return;

    try {
      isFetching = true;

      if (isRefresh) {
        page = 1;
        emit(ImageLoading());
      }

      final newImages = await repository.getImages(page, limit);

      if (state is ImageLoaded && !isRefresh) {

        final currentState = state as ImageLoaded;
        emit(ImageLoaded(
          images: [...currentState.images, ...newImages],
          hasReachedMax: newImages.isEmpty,
        ));
      } else {
        emit(ImageLoaded(
          images: newImages,
          hasReachedMax: newImages.isEmpty,
        ));
      }

      page++;
    } catch (e) {
      emit(ImageError("Failed to load images"));
    } finally {
      isFetching = false;
    }
  }
}
