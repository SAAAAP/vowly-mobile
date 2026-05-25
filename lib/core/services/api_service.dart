import 'package:dio/dio.dart';

class ApiService {

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:5000/api/',
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

}