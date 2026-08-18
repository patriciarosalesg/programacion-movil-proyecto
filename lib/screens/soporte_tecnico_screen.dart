import 'package:flutter/material.dart';

class SoporteTecnicoScreen extends StatefulWidget {
  const SoporteTecnicoScreen({super.key});

  @override
  State<SoporteTecnicoScreen> createState() => _SoporteTecnicoScreenState();
}

class _SoporteTecnicoScreenState extends State<SoporteTecnicoScreen> {
  // Selección de elementos
  String tipoSoporte = 'Hardware';

  // Mostrar u ocultar información
  bool mostrarInformacion = false;

  // Cambio de estado de una solicitud
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

  Color obtenerColorEstado() {
    if (estadoSolicitud == 'Pendiente') {
      return Colors.orange;
    } else if (estadoSolicitud == 'En proceso') {
      return Colors.blue;
    } else {
      return Colors.green;
    }
  }

  void enviarSolicitud() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Solicitud de soporte enviada correctamente.',
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text(
          'Soporte Técnico',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),

      body: Column(
        children: [

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // Encabezado
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.support_agent,
                        color: Colors.white,
                        size: 45,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Techno Design',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Gestión de soporte técnico',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  'Tipo de soporte',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: DropdownButton<String>(
                    value: tipoSoporte,
                    isExpanded: true,
                    underline: const SizedBox(),
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
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        mostrarInformacion = !mostrarInformacion;
                      });
                    },
                    icon: Icon(
                      mostrarInformacion
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    label: Text(
                      mostrarInformacion
                          ? 'Ocultar información'
                          : 'Ver información de soporte',
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                    ),
                  ),
                ),

                if (mostrarInformacion) ...[
                  const SizedBox(height: 15),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Información de soporte',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Atención: Soporte Técnico Techno Design',
                        ),
                        Text(
                          'Horario: 8:00 AM - 5:00 PM',
                        ),
                        Text(
                          'Servicio: Asistencia y soporte técnico',
                        ),
                      ],
                    ),
                  ),
                ],

                const SizedBox(height: 25),

                const Text(
                  'Estado de la solicitud',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.engineering,
                        size: 45,
                        color: obtenerColorEstado(),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        estadoSolicitud,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: obtenerColorEstado(),
                        ),
                      ),

                      const SizedBox(height: 15),

                      ElevatedButton(
                        onPressed: actualizarEstado,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: obtenerColorEstado(),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Actualizar estado',
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Información seleccionada
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Tipo de soporte seleccionado: $tipoSoporte',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: enviarSolicitud,
                icon: const Icon(Icons.send),
                label: const Text(
                  'Enviar solicitud',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1565C0),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
