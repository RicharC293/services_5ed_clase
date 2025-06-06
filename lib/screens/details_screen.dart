import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicios_app/models/services_models.dart';
import 'package:servicios_app/notifiers/services_notifier.dart';
import 'package:servicios_app/notifiers/theme_notifier.dart';
import 'package:servicios_app/screens/create_service_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  static const String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    /// obtener los argumentos de la ruta
    final servicio = ModalRoute.of(context)?.settings.arguments as Service;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.read<ServicesNotifier>().fetchServices();
            Navigator.pop(context);
          },
        ),
        title: const Text("Detalles del Servicio"),
        actions: [
          IconButton(
            icon: Icon(
              context.read<ThemeNotifier>().isDarkMode
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              context.read<ThemeNotifier>().isDarkMode = !context
                  .read<ThemeNotifier>()
                  .isDarkMode;
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                servicio.banner.url!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(servicio.name, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(servicio.description, style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text(
              "Precio: \$${servicio.price}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FilledButton(
          onPressed: () {
            Navigator.pushNamed(context, CreateServiceScreen.routeName);
          },
          child: const Text("Agendar Servicio"),
        ),
      ),
    );
  }
}
