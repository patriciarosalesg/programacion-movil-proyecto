import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/orders_screens.dart';
import 'screens/services_design.dart';
import 'screens/soporte_tecnico_screen.dart';
import 'screens/actualization_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Nombre de la aplicación.

      title: 'My Support Technos Design',
      
      // Tema general de la aplicación.
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
       // Pantalla inicial de la aplicación.
      initialRoute: '/home',

      // Rutas nombradas de la aplicación.
      routes: {
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),

        // Rutas del panel de soporte.
        '/orders': (context) => const OrdersScreen(),
        '/services': (context) => const ServicesDesign(),
        '/soporte-tecnico': (context) => const SoporteTecnicoScreen(),
        '/actualizaciones': (context) => const ActualizationScreen(),
      },
    );
  }
}
