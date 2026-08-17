import 'package:flutter/material.dart';

class ServicesDesign extends StatelessWidget {
  const ServicesDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        title: const Text(
          'Seguimiento del servicio',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Seguimiento de mi servicio',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D47A1),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Consulta el estado actual de tu equipo.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 25),

            // Información de la orden
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Orden TD-0101',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1565C0),
                      ),
                    ),

                    SizedBox(height: 12),

                    Text('Equipo: HP Laptop'),

                    SizedBox(height: 8),

                    Text('Servicio: Diagnóstico y reparación'),

                    SizedBox(height: 8),

                    Text('Fecha de ingreso: 08/08/2026'),

                    SizedBox(height: 8),

                    Text('Entrega estimada: 12/08/2026'),

                    SizedBox(height: 8),

                    Text('Técnico: Área de Soporte Técnico'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Estado del servicio',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Equipo recibido
            _statusStep(
              icon: Icons.inventory_2_outlined,
              title: 'Equipo recibido',
              description: 'El equipo fue recibido por el área técnica.',
              completed: true,
            ),

            _line(),

            // Diagnóstico
            _statusStep(
              icon: Icons.search,
              title: 'Diagnóstico realizado',
              description: 'El equipo fue revisado por el técnico.',
              completed: true,
            ),

            _line(),

            // Reparación
            _statusStep(
              icon: Icons.build_outlined,
              title: 'Equipo en reparación',
              description: 'El equipo se encuentra actualmente en reparación.',
              completed: false,
              current: true,
            ),

            _line(),

            // Reparación finalizada
            _statusStep(
              icon: Icons.check_circle_outline,
              title: 'Reparación finalizada',
              description: 'Pendiente de finalizar el servicio.',
              completed: false,
            ),

            _line(),

            // Listo para entregar
            _statusStep(
              icon: Icons.inventory_outlined,
              title: 'Listo para entregar',
              description: 'El equipo estará disponible para ser retirado.',
              completed: false,
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFE3F2FD),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Color(0xFF1565C0),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'El estado de tu servicio se actualizará conforme avance el proceso técnico.',
                      style: TextStyle(
                        color: Color(0xFF0D47A1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _statusStep({
    required IconData icon,
    required String title,
    required String description,
    required bool completed,
    bool current = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: completed || current
                ? const Color(0xFF1565C0)
                : Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: completed || current
                ? Colors.white
                : Colors.grey.shade600,
          ),
        ),

        const SizedBox(width: 15),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: completed || current
                      ? const Color(0xFF1565C0)
                      : Colors.black54,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _line() {
    return Container(
      margin: const EdgeInsets.only(
        left: 22,
        top: 5,
        bottom: 5,
      ),
      height: 25,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}