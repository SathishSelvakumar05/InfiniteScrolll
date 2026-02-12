import '../../core/network/api_service.dart';
import '../models/image_models.dart';

class ImageRepository {
  final ApiService apiService;

  ImageRepository(this.apiService);

  Future<List<ImageModel>> getImages(int page, int limit) async {
    final response = await apiService.fetchImages(page, limit);

    return (response.data as List)
        .map((e) => ImageModel.fromJson(e))
        .toList();
  }
}
