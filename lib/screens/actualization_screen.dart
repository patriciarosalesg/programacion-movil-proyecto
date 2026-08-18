import 'package:flutter/material.dart';

import '../models/orden_servicios.dart';
import '../widgets/actualizacion_servicio_card.dart';

class ActualizationScreen extends StatelessWidget {
  const ActualizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Recibe la orden enviada desde OrdersScreen.
    final argumentos = ModalRoute.of(context)?.settings.arguments;

    final OrdenServicio? orden =
        argumentos is OrdenServicio ? argumentos : null;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        title: const Text(
          'Actualizaciones del servicio',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Actualizaciones recientes',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0D47A1),
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Consulta los avances registrados por el área técnica sobre tus equipos.',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black54,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 20),

          // Muestra la orden recibida desde OrdersScreen.
          if (orden != null)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Orden seleccionada',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0D47A1),
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Número de orden: ${orden.numeroOrden}',
                    ),

                    Text(
                      'Equipo: ${orden.equipo}',
                    ),

                    Text(
                      'Servicio: ${orden.servicio}',
                    ),

                    Text(
                      'Estado: ${orden.estado}',
                    ),
                  ],
                ),
              ),
            ),

          if (orden != null) const SizedBox(height: 20),

          ActualizacionServicioCard(
            numeroOrden: 'TD-0101',
            equipo: 'HP Laptop',
            problemaReportado:
                'El equipo presenta lentitud y se apaga inesperadamente durante su uso.',
            diagnostico:
                'Se detectó acumulación de polvo y sobrecalentamiento en el sistema de ventilación.',
            mensaje:
                'El equipo se encuentra en proceso de reparación y se está realizando la limpieza interna y revisión del sistema de refrigeración.',
            estado: 'En reparación',
            fecha: '15/08/2026 - 10:30 a. m.',
            onTap: () {
              Navigator.pushNamed(
                context,
                '/services',
              );
            },
          ),

          ActualizacionServicioCard(
            numeroOrden: 'TD-0100',
            equipo: 'MacBook Pro',
            problemaReportado:
                'El equipo presenta lentitud al iniciar y algunas aplicaciones dejan de responder.',
            diagnostico:
                'Se identificó la necesidad de realizar mantenimiento preventivo y pruebas generales del equipo.',
            mensaje:
                'El mantenimiento preventivo fue realizado y el equipo se encuentra en proceso de pruebas para verificar su funcionamiento.',
            estado: 'En reparación',
            fecha: '15/08/2026 - 2:15 p. m.',
            onTap: () {
              Navigator.pushNamed(
                context,
                '/services',
              );
            },
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.notifications_active_outlined,
                  color: Color(0xFF1565C0),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Las actualizaciones se mostrarán conforme el área técnica registre nuevos avances en tu servicio.',
                    style: TextStyle(
                      color: Color(0xFF0D47A1),
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}