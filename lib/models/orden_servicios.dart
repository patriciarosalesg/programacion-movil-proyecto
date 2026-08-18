class OrdenServicio {
  final String numeroOrden;
  final String equipo;
  final String servicio;
  final String fechaIngreso;
  final String fechaEntrega;
  final String estado;
  final String tecnico;

  const OrdenServicio({
    required this.numeroOrden,
    required this.equipo,
    required this.servicio,
    required this.fechaIngreso,
    required this.fechaEntrega,
    required this.estado,
    required this.tecnico,
  });
}