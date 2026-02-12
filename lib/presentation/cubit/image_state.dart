part of 'image_cubit.dart';



abstract class ImageState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageLoaded extends ImageState {
  final List<ImageModel> images;
  final bool hasReachedMax;

  ImageLoaded({
    required this.images,
    required this.hasReachedMax,
  });

  @override
  List<Object?> get props => [images, hasReachedMax];
}

class ImageError extends ImageState {
  final String message;

  ImageError(this.message);

  @override
  List<Object?> get props => [message];
}

