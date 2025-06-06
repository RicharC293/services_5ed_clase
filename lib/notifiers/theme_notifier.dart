// 1. Class extenderla ChangeNotifier
// 2. Variable que mantiene el tema
// 3. Get - permite obtener el valor del tema
// 4. Set - permite cambiar el valor del tema
// 5. Notificar algo a todos los que escuchan en ese momento

import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  // Definir el valor de la variable que mantiene el tema
  bool _isDarkMode = false;

  /// Obtener el valor del tema
  bool get isDarkMode => _isDarkMode;

  /// Cambiar el valor 
  set isDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners(); // Notificar a todos los que escuchan
  }
}