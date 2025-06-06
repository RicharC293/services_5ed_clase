import 'package:dio/dio.dart';
import 'package:servicios_app/models/services_models.dart';

final String baseUrl = 'https://acceptable-eggs-0ba2b16280.strapiapp.com/api';

final dio = Dio(BaseOptions(baseUrl: baseUrl));

Future<ServiceResponse> getServices() async {
  print("LLAMANDO AL API");
  final response = await dio.get(
    '/services',
    queryParameters: {"populate": "*"},
    onReceiveProgress: (value1, value2) {
      print("Recibiendo datos: $value1 de $value2");
    }
  );
  final parseData = ServiceResponse.fromJson(response.data);
  print(parseData);
  print(parseData.data[0].name);
  return parseData;
}
