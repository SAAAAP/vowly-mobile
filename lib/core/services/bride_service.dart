import 'api_service.dart';

class BrideService {

  final api = ApiService().dio;

  Future getBrideProfile(int id) async {

    final response = await api.get(
      'brides/$id',
    );

    return response.data;
  }

  Future updateBrideProfile({
    required int id,
    required String weddingDate,
    required String location,
  }) async {

    final response = await api.put(
      'brides/$id',
      data: {
        'weddingDate': weddingDate,
        'location': location,
      },
    );

    return response.data;
  }
}