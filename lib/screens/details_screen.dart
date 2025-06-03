import 'package:flutter/material.dart';
import 'package:servicios_app/screens/create_service_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  static const String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detalles del Servicio")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/image_general.png",
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Nombre del Servicio",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Descripción detallada del servicio. Aquí puedes incluir información relevante sobre el servicio ofrecido.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              "Precio: \$100",
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
