import 'api_service.dart';

class VendorService {

  final api = ApiService().dio;

  Future getVendors() async {

    final response = await api.get(
      'vendors',
    );

    return response.data;

  }

}