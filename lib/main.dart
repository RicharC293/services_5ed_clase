import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicios_app/notifiers/services_notifier.dart';
import 'package:servicios_app/notifiers/theme_notifier.dart';
import 'package:servicios_app/screens/create_service_screen.dart';
import 'package:servicios_app/screens/details_screen.dart';
import 'package:servicios_app/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> ThemeNotifier()),
        ChangeNotifierProvider(create: (context) => ServicesNotifier()),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Servicios',
          initialRoute: HomeScreen.routeName,
          routes: {
            //Nombre de la ruta : (context) => HomeScreen()
            HomeScreen.routeName: (context) => HomeScreen(),
            // Agregar todas rutas de las otras pantallas
            DetailsScreen.routeName: (context) => DetailsScreen(),
            CreateServiceScreen.routeName: (context) => CreateServiceScreen(),
          },
          debugShowCheckedModeBanner: false,
          theme: context.watch<ThemeNotifier>().isDarkMode
              ? ThemeData.dark()
              : ThemeData.light(),
          // theme: ThemeData(
          //   textTheme: TextTheme(
          //     titleLarge: TextStyle(
          //       fontSize: 26,
          //       fontWeight: FontWeight.w600,
          //       color: Colors.black,
          //     ),
          //   ),
          // ),
        );
      },
    );
  }
}
