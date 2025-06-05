import 'package:flutter/material.dart';
import 'package:servicios_app/screens/details_screen.dart';
import 'package:servicios_app/services/api.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    final widthTotal = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //1. Renderizar una imagen - Redondeados - ClipRRect
          ClipRRect(
            // borderRadius: BorderRadiusGeometry.all(Radius.circular(32)),
            borderRadius: BorderRadius.circular(32),
            child: Image.asset("assets/image_general.png"),
          ),
          //2. Texto "Servicio"
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Servicios",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          //3. List Tile -> Lista los servicios
          Expanded(
            child: FutureBuilder(
              future: getServices(),
              builder: (context, snapshot) {
                // retornar el widget a renderizar
                //1. Estado de cargando
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                //2. Estado de error
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
                //3. Estado de éxito
                if (!snapshot.hasData) {
                  return Text("No hay datos disponibles");
                }
                final services = snapshot.data!.data;
                return ListView.builder(
                  // shrinkWrap: true,
                  itemCount: services.length,
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  itemBuilder: (context, index) {
                    final service = services[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepPurpleAccent,
                        backgroundImage: NetworkImage(service.icon.url!),
                        child: Text("A"),
                      ),
                      title: Text(service.name),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        /// Navegación por nombre "/details"
                        Navigator.pushNamed(context, DetailsScreen.routeName);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
