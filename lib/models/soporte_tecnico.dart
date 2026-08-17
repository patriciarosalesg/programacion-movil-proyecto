import 'package:flutter/material.dart';

class SoporteTecnico extends StatefulWidget {
  const SoporteTecnico({super.key});

  @override
  State<SoporteTecnico> createState() => _SoporteTecnicoState();
}

class _SoporteTecnicoState extends State<SoporteTecnico> {
  // Selección de elementos
  String tipoSoporte = 'Hardware';

  // Mostrar u ocultar componentes
  bool mostrarInformacion = false;

  // Actualización de estado
  String estadoSolicitud = 'Pendiente';

  void actualizarEstado() {
    setState(() {
      if (estadoSolicitud == 'Pendiente') {
        estadoSolicitud = 'En proceso';
      } else if (estadoSolicitud == 'En proceso') {
        estadoSolicitud = 'Completada';
      } else {
        estadoSolicitud = 'Pendiente';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soporte Técnico'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Techno Design',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Gestión de soporte técnico',
                style: TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 30),

              // EJEMPLO 1: SELECCIÓN DE ELEMENTOS
              const Text(
                'Tipo de soporte',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              DropdownButton<String>(
                value: tipoSoporte,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'Hardware',
                    child: Text('Hardware'),
                  ),
                  DropdownMenuItem(
                    value: 'Software',
                    child: Text('Software'),
                  ),
                  DropdownMenuItem(
                    value: 'Redes',
                    child: Text('Redes'),
                  ),
                  DropdownMenuItem(
                    value: 'Mantenimiento',
                    child: Text('Mantenimiento'),
                  ),
                ],
                onChanged: (valor) {
                  setState(() {
                    tipoSoporte = valor!;
                  });
                },
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    mostrarInformacion = !mostrarInformacion;
                  });
                },
                child: Text(
                  mostrarInformacion
                      ? 'Ocultar información'
                      : 'Ver información de soporte',
                ),
              ),

              if (mostrarInformacion) ...[
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Información de soporte',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Atención: Soporte Técnico Techno Design'),
                      Text('Horario: 8:00 AM - 5:00 PM'),
                      Text('Servicio: Atención y asistencia técnica'),
                    ],
                  ),
                ),
              ],

              const SizedBox(height: 30),

              const Text(
                'Estado de la solicitud',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                estadoSolicitud,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: actualizarEstado,
                child: const Text('Actualizar estado'),
              ),

              const SizedBox(height: 30),

              Text(
                'Tipo seleccionado: $tipoSoporte',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}