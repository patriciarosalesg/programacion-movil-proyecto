import 'package:flutter/material.dart';
import '../models/orden_servicios.dart';
import '../widgets/orden_servicio_card.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final List<OrdenServicio> ordenes = [
    const OrdenServicio(
      numeroOrden: 'TD-0100',
      equipo: 'MacBook-Pro',
      servicio: 'Mantenimiento Preventivo',
      fechaIngreso: '17/08/2026',
      fechaEntrega: '20/08/2026',
      estado: 'Lista para entrega',
      tecnico: 'Área de Soporte Técnico',
    ),
    const OrdenServicio(
      numeroOrden: 'TD-0101',
      equipo: 'HP Laptop',
      servicio: 'Diagnóstico y reparación',
      fechaIngreso: '17/08/2026',
      fechaEntrega: '18/08/2026',
      estado: 'En diagnóstico',
      tecnico: 'Área de Soporte Técnico',
    ),
    const OrdenServicio(
      numeroOrden: 'TD-0118',
      equipo: 'Computadora Dell',
      servicio: 'Mantenimiento preventivo',
      fechaIngreso: '17/08/2026',
      fechaEntrega: '19/08/2026',
      estado: 'Lista para entrega',
      tecnico: 'Área de Soporte Técnico',
    ),
    const OrdenServicio(
      numeroOrden: 'TD-0119',
      equipo: 'Lenovo ThinkPad',
      servicio: 'Reparación de sistema',
      fechaIngreso: '20/08/2026',
      fechaEntrega: '22/08/2026',
      estado: 'En reparación',
      tecnico: 'Área de Soporte Técnico',
    ),
    const OrdenServicio(
      numeroOrden: 'TD-0120',
      equipo: 'Acer Aspire',
      servicio: 'Mantenimiento preventivo',
      fechaIngreso: '21/08/2026',
      fechaEntrega: '22/08/2026',
      estado: 'En diagnóstico',
      tecnico: 'Área de Soporte Técnico',
    ),
    const OrdenServicio(
      numeroOrden: 'TD-0121',
      equipo: 'Dell Inspiron',
      servicio: 'Cambio de disco SSD',
      fechaIngreso: '22/08/2026',
      fechaEntrega: '24/08/2026',
      estado: 'En reparación',
      tecnico: 'Área de Soporte Técnico',
    ),
    const OrdenServicio(
      numeroOrden: 'TD-0122',
      equipo: 'ASUS VivoBook',
      servicio: 'Instalación de software',
      fechaIngreso: '22/08/2026',
      fechaEntrega: '24/08/2026',
      estado: 'En diagnóstico',
      tecnico: 'Área de Soporte Técnico',
    ),
    const OrdenServicio(
      numeroOrden: 'TD-0123',
      equipo: 'HP Pavilion',
      servicio: 'Limpieza interna',
      fechaIngreso: '23/08/2026',
      fechaEntrega: '24/08/2026',
      estado: 'En reparación',
      tecnico: 'Área de Soporte Técnico',
    ),
    const OrdenServicio(
      numeroOrden: 'TD-0124',
      equipo: 'iMac',
      servicio: 'Mantenimiento general',
      fechaIngreso: '24/08/2026',
      fechaEntrega: '25/08/2026',
      estado: 'Pendiente',
      tecnico: 'Área de Soporte Técnico',
    ),
    const OrdenServicio(
      numeroOrden: 'TD-0125',
      equipo: 'Microsoft Surface',
      servicio: 'Diagnóstico de hardware',
      fechaIngreso: '25/08/2026',
      fechaEntrega: '26/08/2026',
      estado: 'En diagnóstico',
      tecnico: 'Área de Soporte Técnico',
    ),
  ];

  final Set<String> favoritos = {};

  final TextEditingController equipoController =
      TextEditingController();

  final TextEditingController servicioController =
      TextEditingController();

  final TextEditingController fechaController =
      TextEditingController();

  // 5.4 - Texto de búsqueda
  String textoBusqueda = '';

  @override
  void dispose() {
    equipoController.dispose();
    servicioController.dispose();
    fechaController.dispose();
    super.dispose();
  }

  void cambiarFavorito(String numeroOrden) {
    setState(() {
      if (favoritos.contains(numeroOrden)) {
        favoritos.remove(numeroOrden);
      } else {
        favoritos.add(numeroOrden);
      }
    });
  }

  void confirmarEliminacion(OrdenServicio orden) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Eliminar orden'),
          content: Text(
            '¿Desea eliminar la orden ${orden.numeroOrden}?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  ordenes.removeWhere(
                    (item) =>
                        item.numeroOrden == orden.numeroOrden,
                  );

                  favoritos.remove(orden.numeroOrden);
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Orden ${orden.numeroOrden} eliminada.',
                    ),
                  ),
                );
              },
              child: const Text(
                'Eliminar',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void abrirFormularioNuevaOrden() {
    equipoController.clear();
    servicioController.clear();
    fechaController.clear();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom:
                MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nueva orden de servicio',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1565C0),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: equipoController,
                  decoration: const InputDecoration(
                    labelText: 'Equipo',
                    prefixIcon: Icon(Icons.computer),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: servicioController,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de servicio',
                    prefixIcon: Icon(Icons.build),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: fechaController,
                  decoration: const InputDecoration(
                    labelText: 'Fecha de entrega',
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancelar'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (equipoController.text.isEmpty ||
                              servicioController.text.isEmpty ||
                              fechaController.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Completa todos los campos.',
                                ),
                              ),
                            );
                            return;
                          }

                          setState(() {
                            ordenes.add(
                              OrdenServicio(
                                numeroOrden:
                                    'TD-${1000 + ordenes.length}',
                                equipo: equipoController.text,
                                servicio: servicioController.text,
                                fechaIngreso: '15/08/2026',
                                fechaEntrega: fechaController.text,
                                estado: 'Pendiente',
                                tecnico:
                                    'Área de Soporte Técnico',
                              ),
                            );
                          });

                          Navigator.pop(context);

                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Nueva orden agregada correctamente.',
                              ),
                            ),
                          );
                        },
                        child: const Text('Guardar'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void editarOrden(OrdenServicio orden) {
    final equipoEditar =
        TextEditingController(text: orden.equipo);

    final servicioEditar =
        TextEditingController(text: orden.servicio);

    final fechaEditar =
        TextEditingController(text: orden.fechaEntrega);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar orden'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: equipoEditar,
                  decoration: const InputDecoration(
                    labelText: 'Equipo',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: servicioEditar,
                  decoration: const InputDecoration(
                    labelText: 'Servicio',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: fechaEditar,
                  decoration: const InputDecoration(
                    labelText: 'Fecha de entrega',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  final index = ordenes.indexWhere(
                    (item) =>
                        item.numeroOrden ==
                        orden.numeroOrden,
                  );

                  if (index != -1) {
                    ordenes[index] = OrdenServicio(
                      numeroOrden: orden.numeroOrden,
                      equipo: equipoEditar.text,
                      servicio: servicioEditar.text,
                      fechaIngreso: orden.fechaIngreso,
                      fechaEntrega: fechaEditar.text,
                      estado: orden.estado,
                      tecnico: orden.tecnico,
                    );
                  }
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Orden ${orden.numeroOrden} actualizada.',
                    ),
                  ),
                );
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double anchoPantalla =
        MediaQuery.of(context).size.width;

    final double margenHorizontal =
        anchoPantalla > 600 ? 60 : 20;

    // Filtrado de órdenes
    final String busqueda =
        textoBusqueda.trim().toLowerCase();

    final List<OrdenServicio> ordenesFiltradas =
        ordenes.where((orden) {
      return orden.numeroOrden.toLowerCase().contains(busqueda) ||
          orden.equipo.toLowerCase().contains(busqueda) ||
          orden.servicio.toLowerCase().contains(busqueda);
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),

      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        title: const Text(
          'Mis órdenes de servicio',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          // Barra de búsqueda
          Padding(
            padding: EdgeInsets.fromLTRB(
              margenHorizontal,
              20,
              margenHorizontal,
              10,
            ),
            child: TextField(
              onChanged: (valor) {
                setState(() {
                  textoBusqueda = valor;
                });
              },
              decoration: InputDecoration(
                hintText: 'Buscar por orden, equipo o servicio',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xFF1565C0),
                ),
                suffixIcon: textoBusqueda.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            textoBusqueda = '';
                          });
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xFF1565C0),
                    width: 2,
                  ),
                ),
              ),
            ),
          ),

          // Mensaje cuando no hay resultados
          if (ordenesFiltradas.isEmpty)
            const Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.search_off,
                      size: 55,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'No se encontraron órdenes.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: margenHorizontal,
                  vertical: 10,
                ),
                itemCount: ordenesFiltradas.length,
                itemBuilder: (context, index) {
                  final orden = ordenesFiltradas[index];

                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 15,
                    ),
                    child: Dismissible(
                      key: ValueKey(orden.numeroOrden),

                      background: Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius:
                              BorderRadius.circular(15),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Editar',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      secondaryBackground: Container(
                        padding:
                            const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              BorderRadius.circular(15),
                        ),
                        child: const Row(
                          mainAxisAlignment:
                              MainAxisAlignment.end,
                          children: [
                            Text(
                              'Eliminar',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),

                      direction:
                          DismissDirection.horizontal,

                      confirmDismiss:
                          (direction) async {
                        if (direction ==
                            DismissDirection.startToEnd) {
                          editarOrden(orden);
                          return false;
                        }

                        if (direction ==
                            DismissDirection.endToStart) {
                          final confirmar =
                              await showDialog<bool>(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  'Confirmar eliminación',
                                ),
                                content: Text(
                                  '¿Desea eliminar la orden ${orden.numeroOrden}?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(
                                        context,
                                        false,
                                      );
                                    },
                                    child: const Text(
                                      'Cancelar',
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(
                                        context,
                                        true,
                                      );
                                    },
                                    child: const Text(
                                      'Eliminar',
                                    ),
                                  ),
                                ],
                              );
                            },
                          );

                          return confirmar ?? false;
                        }

                        return false;
                      },

                      onDismissed: (direction) {
                        if (direction ==
                            DismissDirection
                                .endToStart) {
                          setState(() {
                            ordenes.removeWhere(
                              (item) =>
                                  item.numeroOrden ==
                                  orden.numeroOrden,
                            );

                            favoritos.remove(
                              orden.numeroOrden,
                            );
                          });

                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            SnackBar(
                              content: Text(
                                'Orden ${orden.numeroOrden} eliminada.',
                              ),
                            ),
                          );
                        }
                      },

                      child: GestureDetector(
                        onLongPress: () {
                          confirmarEliminacion(orden);
                        },

                        child: OrdenServicioCard(
                          numeroOrden:
                              orden.numeroOrden,
                          equipo: orden.equipo,
                          servicio: orden.servicio,
                          estado: orden.estado,
                          fechaEntrega:
                              orden.fechaEntrega,

                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/actualizaciones',
                              arguments: orden,
                            );
                          },

                          onToggleFavorite: () {
                            cambiarFavorito(
                              orden.numeroOrden,
                            );
                          },

                          esFavorito: favoritos.contains(
                            orden.numeroOrden,
                          ),

                          mostrarEstado: true,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),

      floatingActionButton:
          FloatingActionButton.extended(
        onPressed: abrirFormularioNuevaOrden,
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Nueva orden'),
      ),
    );
  }
}
