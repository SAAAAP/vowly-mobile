import 'api_service.dart';

class ChecklistService {

  final api = ApiService().dio;

  Future getChecklist(int brideId) async {

    final response = await api.get(
      'checklists/$brideId',
    );

    return response.data;
  }

  Future createChecklist({
    required int brideId,
    required String title,
  }) async {

    final response = await api.post(
      'checklists',
      data: {
        'brideId': brideId,
        'title': title,
      },
    );

    return response.data;
  }

  Future toggleChecklist(int id) async {

    final response = await api.put(
      'checklists/$id',
    );

    return response.data;
  }
}