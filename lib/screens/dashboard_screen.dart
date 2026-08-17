import 'package:flutter/material.dart';

import 'orders_screens.dart';
import 'services_design.dart';
import 'soporte_tecnico_screen.dart';
import 'login_screen.dart';
import 'actualization_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Guarda la sección seleccionada de la barra inferior.
  int _indiceActual = 0;

  // Tres secciones principales.
  final List<Widget> _secciones = const [
    InicioSection(),
    OrdenesSection(),
    PerfilSection(),
  ];

  // Cambia la sección seleccionada.
  void _cambiarSeccion(int indice) {
    setState(() {
      _indiceActual = indice;
    });
  }

  // SnackBar con acción "VER".
  void _mostrarSnackBarConVer() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Tienes una nueva actualización de servicio.',
        ),
        duration: const Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        action: SnackBarAction(
          label: 'VER',
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/actualizaciones',
            );
          },
        ),
      ),
    );
  }

  // SnackBar flotante durante 5 segundos.
  void _mostrarSnackBarFlotante() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'La solicitud fue procesada correctamente.',
        ),
        duration: const Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              // Encabezado personalizado.
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(
                  20,
                  25,
                  20,
                  22,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF1565C0),
                      Color(0xFF0D47A1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.computer,
                      color: Colors.white,
                      size: 48,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'My Support Technos Design',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Soporte técnico',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              // Opciones del Drawer.
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    // Opción 1 - Soporte técnico.
                    ListTile(
                      leading: const Icon(
                        Icons.support_agent,
                        color: Color(0xFF1565C0),
                      ),
                      title: const Text('Soporte técnico'),
                      onTap: () {
                        Navigator.pop(context);

                        Navigator.pushNamed(
                          context,
                          '/soporte-tecnico',
                        );
                      },
                    ),

                    // Opción 2 - Servicios.
                    ListTile(
                      leading: const Icon(
                        Icons.miscellaneous_services,
                        color: Color(0xFF1565C0),
                      ),
                      title: const Text('Servicios'),
                      onTap: () {
                        Navigator.pop(context);

                        Navigator.pushNamed(
                          context,
                          '/services',
                        );
                      },
                    ),

                    // Opción 3 - ExpansionTile.
                    ExpansionTile(
                      leading: const Icon(
                        Icons.category,
                        color: Color(0xFF1565C0),
                      ),
                      title: const Text('Categorías'),
                      children: [
                        ListTile(
                          contentPadding: const EdgeInsets.only(
                            left: 72,
                            right: 16,
                          ),
                          leading: const Icon(
                            Icons.computer,
                            size: 20,
                          ),
                          title: const Text('Hardware'),
                          onTap: () {
                            Navigator.pop(context);

                            Navigator.pushNamed(
                              context,
                              '/soporte-tecnico',
                            );
                          },
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.only(
                            left: 72,
                            right: 16,
                          ),
                          leading: const Icon(
                            Icons.apps,
                            size: 20,
                          ),
                          title: const Text('Software'),
                          onTap: () {
                            Navigator.pop(context);

                            Navigator.pushNamed(
                              context,
                              '/soporte-tecnico',
                            );
                          },
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.only(
                            left: 72,
                            right: 16,
                          ),
                          leading: const Icon(
                            Icons.router,
                            size: 20,
                          ),
                          title: const Text('Redes'),
                          onTap: () {
                            Navigator.pop(context);

                            Navigator.pushNamed(
                              context,
                              '/soporte-tecnico',
                            );
                          },
                        ),
                      ],
                    ),

                    // Notificaciones.
                    ListTile(
                      leading: const Icon(
                        Icons.notifications_outlined,
                        color: Color(0xFF1565C0),
                      ),
                      title: const Text('Notificaciones'),
                      onTap: () {
                        Navigator.pop(context);

                        Navigator.pushNamed(
                          context,
                          '/actualizaciones',
                        );
                      },
                    ),

                    // Ayuda.
                    ListTile(
                      leading: const Icon(
                        Icons.help_outline,
                        color: Color(0xFF1565C0),
                      ),
                      title: const Text('Ayuda'),
                      onTap: () {
                        Navigator.pop(context);
                        _mostrarSnackBarFlotante();
                      },
                    ),

                    // Acerca de.
                    ListTile(
                      leading: const Icon(
                        Icons.info_outline,
                        color: Color(0xFF1565C0),
                      ),
                      title: const Text('Acerca de'),
                      onTap: () {
                        Navigator.pop(context);
                        _mostrarSnackBarFlotante();
                      },
                    ),
                  ],
                ),
              ),

              // Última opción: Cerrar sesión.
              const Divider(height: 1),

              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                title: const Text(
                  'Cerrar sesión',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),

      // BARRA SUPERIOR.
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Support Technos Design',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),

      // INDEXEDSTACK.
      body: IndexedStack(
        index: _indiceActual,
        children: _secciones,
      ),

      // BOTTOM NAVIGATION BAR.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceActual,
        onTap: _cambiarSeccion,
        selectedItemColor: const Color(0xFF1565C0),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            activeIcon: Icon(Icons.assignment),
            label: 'Órdenes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

class InicioSection extends StatelessWidget {
  const InicioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),

          const Icon(
            Icons.support_agent,
            size: 65,
            color: Color(0xFF1565C0),
          ),

          const SizedBox(height: 15),

          const Text(
            '¡Bienvenido!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1565C0),
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Consulta y da seguimiento a tus servicios de soporte.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black54,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 30),

          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Panel de soporte',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D47A1),
              ),
            ),
          ),

          const SizedBox(height: 15),

          _dashboardButton(
            context,
            Icons.assignment,
            'Mis órdenes de servicio',
            () {
              Navigator.pushNamed(context, '/orders');
            },
          ),

          _dashboardButton(
            context,
            Icons.build_outlined,
            'Seguimiento de servicio',
            () {
              Navigator.pushNamed(context, '/services');
            },
          ),

          _dashboardButton(
            context,
            Icons.notifications_active_outlined,
            'Actualizaciones del servicio',
            () {
              Navigator.pushNamed(context, '/actualizaciones');
            },
          ),
        ],
      ),
    );
  }
}

class OrdenesSection extends StatelessWidget {
  const OrdenesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const OrdersScreen();
  }
}

class PerfilSection extends StatelessWidget {
  const PerfilSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 30),

          const CircleAvatar(
            radius: 45,
            backgroundColor: Color(0xFFE3F2FD),
            child: Icon(
              Icons.person,
              size: 55,
              color: Color(0xFF1565C0),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Perfil del cliente',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1565C0),
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            'Información del cliente',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 25),

          // 1. Card + ListTile.
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.email,
                color: Color(0xFF1565C0),
              ),
              title: const Text('Correo electrónico'),
              subtitle: const Text(
                'cliente@technosdesign.com',
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
          ),

          // 2. Card + ListTile.
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.phone,
                color: Color(0xFF1565C0),
              ),
              title: const Text('Teléfono'),
              subtitle: const Text(
                '+504 0000-0000',
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
          ),

          // 3. Card + ListTile.
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.computer,
                color: Color(0xFF1565C0),
              ),
              title: const Text('Equipo registrado'),
              subtitle: const Text(
                'Computadora Dell',
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
          ),

          // 4. Card + ListTile.
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.build,
                color: Color(0xFF1565C0),
              ),
              title: const Text('Servicios realizados'),
              subtitle: const Text(
                '3 servicios registrados',
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
          ),

          // 5. Card + ListTile.
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.check_circle_outline,
                color: Color(0xFF1565C0),
              ),
              title: const Text('Estado de cuenta'),
              subtitle: const Text(
                'Cuenta activa',
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _dashboardButton(
  BuildContext context,
  IconData icon,
  String title,
  VoidCallback onPressed,
) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 12),
    child: ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}