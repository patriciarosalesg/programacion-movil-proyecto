import 'package:flutter/material.dart';

class OrdenServicioCard extends StatelessWidget {
  // Datos de la orden de servicio
  final String numeroOrden;
  final String equipo;
  final String servicio;
  final String estado;
  final String fechaEntrega;

  // Acciones que puede realizar el usuario
  final VoidCallback onTap;
  final VoidCallback onToggleFavorite;

  // Parámetros opcionales
  final bool mostrarEstado;
  final bool esFavorito;

  const OrdenServicioCard({
    super.key,
    required this.numeroOrden,
    required this.equipo,
    required this.servicio,
    required this.estado,
    required this.fechaEntrega,
    required this.onTap,
    required this.onToggleFavorite,
    this.mostrarEstado = true,
    this.esFavorito = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Encabezado de la orden
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.computer,
                      color: Color(0xFF1565C0),
                      size: 30,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      equipo,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Botón de favorito
                  IconButton(
                    onPressed: onToggleFavorite,
                    icon: Icon(
                      esFavorito
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: esFavorito
                          ? Colors.red
                          : Colors.grey,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Text(
                'Orden: $numeroOrden',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Servicio: $servicio',
              ),

              const SizedBox(height: 8),

              Text(
                'Fecha estimada de entrega: $fechaEntrega',
              ),

              // Elemento condicional
              if (mostrarEstado) ...[
                const SizedBox(height: 12),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3F2FD),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    estado,
                    style: const TextStyle(
                      color: Color(0xFF1565C0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}