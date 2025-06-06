import 'package:flutter/material.dart';
import 'package:servicios_app/models/services_models.dart';
import 'package:servicios_app/services/api.dart';

class ServicesNotifier extends ChangeNotifier {

  List<Service>? _services;

  List<Service>? get services => _services;

  /// Aquí nosotros vamos a llamar al servicio
  Future<void> fetchServices() async {
    final response = await getServices();
    _services = response.data;
    notifyListeners(); // Notificar a todos los que escuchan
  }

}