import 'package:flutter/material.dart';
import 'package:servicios_app/screens/details_screen.dart';

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
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          //3. List Tile -> Lista los servicios
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepPurpleAccent,
              backgroundImage: AssetImage("assets/image_general.png"),
              child: Text("A"),
            ),
            title: Text("Servicio 1"),
            subtitle: Text("Descripción del servicio 1"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              /// Navegación por nombre "/details"
              Navigator.pushNamed(context, DetailsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
