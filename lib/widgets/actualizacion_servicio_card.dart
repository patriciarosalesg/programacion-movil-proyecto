import 'package:flutter/material.dart';

class ActualizacionServicioCard extends StatelessWidget {
  final String numeroOrden;
  final String equipo;
  final String problemaReportado;
  final String diagnostico;
  final String mensaje;
  final String estado;
  final String fecha;

  final VoidCallback onTap;

  const ActualizacionServicioCard({
    super.key,
    required this.numeroOrden,
    required this.equipo,
    required this.problemaReportado,
    required this.diagnostico,
    required this.mensaje,
    required this.estado,
    required this.fecha,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    IconData iconoEstado;
    Color colorEstado;

    if (estado == 'En reparación') {
      iconoEstado = Icons.build_outlined;
      colorEstado = Colors.orange;
    } else if (estado == 'En diagnóstico') {
      iconoEstado = Icons.search;
      colorEstado = Colors.blue;
    } else if (estado == 'Lista para entrega') {
      iconoEstado = Icons.check_circle_outline;
      colorEstado = Colors.green;
    } else {
      iconoEstado = Icons.info_outline;
      colorEstado = Colors.grey;
    }

    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor:
                      colorEstado.withValues(alpha: 0.12),
                  child: Icon(
                    iconoEstado,
                    color: colorEstado,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Actualización del servicio',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Orden $numeroOrden',
                        style: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            Row(
              children: [
                const Icon(
                  Icons.computer,
                  color: Color(0xFF1565C0),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    equipo,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            const Text(
              'Problema reportado',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              problemaReportado,
              style: const TextStyle(
                fontSize: 14,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 14),

            const Text(
              'Diagnóstico técnico',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              diagnostico,
              style: const TextStyle(
                fontSize: 14,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 14),

            const Text(
              'Actualización',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              mensaje,
              style: const TextStyle(
                fontSize: 14,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: colorEstado.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    iconoEstado,
                    size: 18,
                    color: colorEstado,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    estado,
                    style: TextStyle(
                      color: colorEstado,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 16,
                  color: Colors.black45,
                ),
                const SizedBox(width: 6),
                Text(
                  fecha,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton.icon(
                onPressed: onTap,
                icon: const Icon(
                  Icons.visibility_outlined,
                ),
                label: const Text('VER'),
                style: OutlinedButton.styleFrom(
                  foregroundColor:
                      const Color(0xFF1565C0),
                  side: const BorderSide(
                    color: Color(0xFF1565C0),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}