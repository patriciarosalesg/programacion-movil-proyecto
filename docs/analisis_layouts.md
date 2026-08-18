# Análisis de Layouts y Navegación — My Support Technos Design

### Datos del estudiante

**Estudiante:** Patricia Elizabeth Rosales Guillen
**Carrera:** Ingeniería en Informática  
**Asignatura:** Programación Móvil  
**Código:** CCC218-3  
**Semana:** 4  
**Actividad:** 4.2 — Análisis de Problemas 2  
**Docente:** Ing. Reynaldo Jose Cruz  
**Fecha de entrega:** 16 de agosto de 2026 

### Datos del proyecto

**Nombre de la aplicación:** My Support Technos Design  
**Empresa:** Technos Design Computadoras  
**Tecnología:** Flutter / Dart  

### Descripción del proyecto

My Support Technos Design es una aplicación móvil desarrollada en Flutter para facilitar a los clientes de Technos Design Computadoras la consulta y el seguimiento de sus órdenes de servicio técnico.

La aplicación permite consultar órdenes, visualizar el estado de los servicios, revisar actualizaciones y acceder a diferentes opciones de soporte técnico mediante una navegación organizada y adaptada a dispositivos móviles.


**Actividad 4.2 — Implementación de Layouts y Navegación Completa del Proyecto**

## 4.1 Inventario de pantallas

El proyecto **My Support Technos Design** cuenta actualmente con siete pantallas principales. Para cada pantalla se identificó el layout, los widgets principales y el tipo de contenido que realmente se utiliza en la implementación actual del proyecto.

| # | Pantalla | Archivo | Layout principal | Justificación |
|---|
| 1 | Login | `login_screen.dart` | `SingleChildScrollView` + `Column` | Organiza el formulario de inicio de sesión de manera vertical. El desplazamiento permite adaptarse a pantallas pequeñas y al teclado. |
| 2 | Home | `home_screen.dart` | `SingleChildScrollView` + `Column` | Organiza verticalmente el encabezado, el logo, la información principal, el botón de acceso y los servicios disponibles. |
| 3 | Dashboard | `dashboard_screen.dart` | `IndexedStack` + `Column` + `Expanded` + `ListView` | Permite organizar las secciones principales de la aplicación y mantener tres opciones disponibles mediante navegación inferior: Inicio, Órdenes y Perfil. |
| 4 | Órdenes de servicio | `orders_screens.dart` | `ListView.builder` + `Card` + `Dismissible` | Permite mostrar varias órdenes de servicio en una lista desplazable. Cada orden se presenta mediante una tarjeta y permite acciones como editar, eliminar y marcar como favorita. |
| 5 | Seguimiento del servicio | `services_design.dart` | `SingleChildScrollView` + `Column` + `Card` | Organiza la información de la orden y las diferentes etapas del servicio técnico de forma vertical, permitiendo visualizar el progreso del equipo. |
| 6 | Soporte técnico | `soporte_tecnico_screen.dart` | `ListView` + `Container` + `DropdownButton` | Permite organizar las opciones de soporte técnico, seleccionar el tipo de soporte, consultar información, actualizar el estado y enviar una solicitud. |
| 7 | Actualizaciones del servicio | `actualization_screen.dart` | `ListView` + `Card` | Permite presentar las actualizaciones recientes de las órdenes de servicio de manera vertical y organizada, incluyendo la información de cada equipo y su estado. |

## 4.2 Mapa de navegación

La navegación de My Support Technos Design se encuentra implementada mediante **rutas nombradas (`named routes`)**, definidas en el archivo `main.dart`.

La aplicación inicia en la pantalla **Home** y desde allí el usuario puede acceder al inicio de sesión. Después de validar el formulario de acceso, el usuario es dirigido al **Dashboard**, que funciona como panel principal de la aplicación.

Desde el Dashboard se puede acceder a las diferentes funciones mediante la barra de navegación inferior, los botones del panel y el menú lateral (`Drawer`).

### Flujo de navegación principal

```text
Home
 │
 └──► Iniciar sesión
          │
          │ Validación correcta
          │ pushNamedAndRemoveUntil
          ▼
     Dashboard
          │
          ├──► Inicio
          │      ├──► Órdenes de servicio
          │      ├──► Seguimiento de servicio
          │      └──► Actualizaciones del servicio
          │
          ├──► Órdenes
          │      └──► Actualizaciones del servicio
          │
          └──► Perfil
                 │
                 └──► Información del cliente

Dashboard
 │
 └──► Drawer
        │
        ├──► Soporte técnico
        ├──► Servicios
        ├──► Categorías
        │      ├──► Hardware
        │      ├──► Software
        │      └──► Redes
        ├──► Notificaciones
        │      └──► Actualizaciones del servicio
        ├──► Ayuda
        ├──► Acerca de
        └──► Cerrar sesión
                │
                └──► Login
```

### Rutas nombradas utilizadas

Las rutas principales definidas en `main.dart` son:

```text
/home
/login
/dashboard
/orders
/services
/soporte-tecnico
/actualizaciones
```
Estas rutas permiten mantener organizada la navegación entre las diferentes pantallas del proyecto.

## 4.3 Widgets principales utilizados

Para la implementación de los layouts y la navegación se utilizaron diferentes widgets de Flutter de acuerdo con las necesidades de cada pantalla.

### Widgets de estructura y layout

* `Scaffold`: proporciona la estructura principal de las pantallas.
* `AppBar`: muestra la barra superior con el título de cada pantalla.
* `Column`: organiza los elementos verticalmente.
* `Row`: organiza elementos horizontalmente.
* `Expanded`: permite que un elemento ocupe el espacio disponible.
* `Container`: permite crear secciones con padding, colores, bordes y decoración.
* `Padding`: controla el espacio interno de los elementos.
* `SingleChildScrollView`: permite desplazar contenido cuando no cabe completamente en la pantalla.
* `ListView`: permite mostrar contenido vertical desplazable.
* `ListView.builder`: genera dinámicamente las órdenes de servicio.

### Widgets para mostrar información

* `Card`: permite presentar información dentro de tarjetas visuales.
* `ListTile`: utilizado en la sección de perfil del Dashboard para organizar información del cliente.
* `Text`: muestra títulos, descripciones y datos.
* `Icon`: representa visualmente las diferentes funciones.
* `Image.asset`: permite mostrar el logo de Technos Design en la pantalla Home.

### Widgets interactivos

* `ElevatedButton`: botones principales de la aplicación.
* `ElevatedButton.icon`: botones que incluyen un ícono.
* `TextButton`: utilizado para acciones secundarias.
* `TextFormField`: campos del formulario de inicio de sesión.
* `TextField`: utilizado para búsqueda y captura de datos.
* `DropdownButton`: permite seleccionar el tipo de soporte.
* `IconButton`: permite cambiar acciones como mostrar u ocultar la contraseña.
* `FloatingActionButton.extended`: permite crear una nueva orden de servicio.
* `Dismissible`: permite deslizar una orden para editarla o eliminarla.
* `GestureDetector`: permite detectar una pulsación prolongada sobre una orden.
* `ExpansionTile`: permite mostrar las categorías de soporte y sus subopciones.
* `BottomNavigationBar`: permite cambiar entre las secciones principales del Dashboard.

### Widgets para navegación y organización

* `IndexedStack`: mantiene las tres secciones principales del Dashboard y permite cambiar entre ellas.
* `Drawer`: proporciona el menú lateral de navegación.
* `BottomNavigationBar`: proporciona la navegación inferior.
* `Navigator.pushNamed`: permite navegar mediante rutas nombradas.
* `Navigator.pushNamedAndRemoveUntil`: permite realizar una navegación eliminando las rutas anteriores, utilizado principalmente después del inicio de sesión y al cerrar sesión.

### Widgets para mensajes y confirmaciones

* `SnackBar`: muestra mensajes temporales al usuario.
* `SnackBarAction`: permite agregar una acción al mensaje, como la opción **VER**.
* `AlertDialog`: permite solicitar confirmación antes de eliminar una orden.
* `showModalBottomSheet`: permite mostrar el formulario para crear una nueva orden.

## 4.4 Tipo de navegación utilizada

El proyecto utiliza principalmente **navegación mediante rutas nombradas**.

Las rutas son declaradas en `MaterialApp`, dentro de la propiedad `routes` del archivo `main.dart`. Esto permite identificar cada pantalla mediante un nombre y facilita la navegación desde diferentes partes de la aplicación.

Ejemplo de navegación:

```dart
Navigator.pushNamed(
  context,
  '/orders',
);
```

Para el inicio de sesión se utiliza:

```dart
Navigator.pushNamedAndRemoveUntil(
  context,
  '/dashboard',
  (route) => false,
);
```

De esta manera, después de iniciar sesión correctamente, el usuario llega al Dashboard y no regresa nuevamente al Login mediante el botón de retroceso.

Para cerrar sesión se utiliza nuevamente `pushNamedAndRemoveUntil`, pero en dirección hacia `/login`.

## 4.5 Navegación interna del Dashboard

El Dashboard implementa una navegación interna mediante `BottomNavigationBar` e `IndexedStack`.

Las tres secciones principales son:

1. **Inicio**
2. **Órdenes**
3. **Perfil**

El índice seleccionado se almacena en la variable:

```dart
int _indiceActual = 0;
```

Cuando el usuario selecciona otra sección, se actualiza el índice mediante `setState()`.

El `IndexedStack` muestra la sección correspondiente:

```dart
IndexedStack(
  index: _indiceActual,
  children: _secciones,
)
```

Esta implementación permite cambiar de sección sin reconstruir completamente la estructura del Dashboard.

## 4.6 Drawer y navegación lateral

El Dashboard también cuenta con un menú lateral implementado mediante `Drawer`.

El menú utiliza un encabezado personalizado con:

* `Container`
* `LinearGradient`
* `Icon`
* `Text`

Dentro del Drawer se encuentran las principales opciones:

* Soporte técnico
* Servicios
* Categorías
* Notificaciones
* Ayuda
* Acerca de
* Cerrar sesión

La opción **Categorías** utiliza `ExpansionTile` para mostrar las subopciones:

* Hardware
* Software
* Redes

Al seleccionar una opción, el Drawer se cierra mediante:

```dart
Navigator.pop(context);
```
Después se ejecuta la navegación correspondiente mediante una ruta nombrada.

## 4.7 Navegación entre órdenes y actualizaciones

En la pantalla de órdenes de servicio, cada orden se presenta mediante `OrdenServicioCard`.

Al seleccionar una orden se utiliza:

```dart
Navigator.pushNamed(
  context,
  '/actualizaciones',
  arguments: orden,
);
```
De esta forma, la información de la orden seleccionada se envía hacia la pantalla de **Actualizaciones del servicio**.

En `actualization_screen.dart`, la información se recibe mediante:

```dart
final argumentos = ModalRoute.of(context)?.settings.arguments;
```
Posteriormente se verifica que el objeto recibido sea una instancia de `OrdenServicio`.

Esto permite que la pantalla de actualizaciones muestre información relacionada con la orden que el usuario seleccionó.

## 4.8 Decisiones de diseño

Las decisiones de diseño se tomaron considerando la funcionalidad actual del proyecto y la facilidad de uso para el cliente.

### Organización del contenido

Se utilizaron layouts verticales como `Column`, `ListView` y `SingleChildScrollView` para organizar la información de forma clara y permitir desplazamiento cuando el contenido supera el espacio disponible.

### Identificación visual

Se utilizaron colores azules como colores principales de la aplicación, principalmente:

```text
#1565C0
#0D47A1
```
Estos colores se mantienen de forma consistente en las barras superiores, botones, íconos y títulos principales.

### Navegación

Se utilizaron rutas nombradas para mantener organizada la navegación entre pantallas y facilitar futuras modificaciones o integración con otras funcionalidades.

### Dashboard

El Dashboard funciona como punto central después del inicio de sesión. Se decidió utilizar `BottomNavigationBar` para las funciones principales y `Drawer` para las opciones secundarias.

### Órdenes de servicio

Se utilizó `ListView.builder` porque la cantidad de órdenes puede aumentar. Además, `Dismissible` permite implementar las acciones de editar y eliminar mediante gestos.

### Interactividad

Se incorporaron diferentes elementos interactivos para cumplir con los requerimientos de la actividad:

* Cambio de favorito.
* Pulsación prolongada.
* Deslizamiento para editar.
* Deslizamiento para eliminar.
* Botón flotante para agregar una orden.
* Barra de búsqueda.
* Mensajes `SnackBar`.
* Ventanas `AlertDialog`.
* Selección mediante `DropdownButton`.
* Menú desplegable mediante `ExpansionTile`.

### Diseño adaptable

Se utilizaron elementos como `Expanded`, `SingleChildScrollView`, `ListView` y márgenes adaptativos para que la aplicación pueda utilizarse en diferentes tamaños de pantalla.

## 4.9 Resumen del análisis

El proyecto My Support Technos Design cuenta con una estructura de navegación organizada y diferentes layouts adaptados a la función de cada pantalla.

La aplicación utiliza:

* `Column`
* `Row`
* `Container`
* `Expanded`
* `SingleChildScrollView`
* `ListView`
* `ListView.builder`
* `Card`
* `ListTile`
* `IndexedStack`
* `BottomNavigationBar`
* `Drawer`
* `ExpansionTile`
* `Dismissible`
* `GestureDetector`
* `FloatingActionButton.extended`
* `SnackBar`
* `AlertDialog`
* Rutas nombradas

La combinación de estos widgets permite construir una interfaz organizada, interactiva y preparada para continuar evolucionando en las siguientes etapas del proyecto, incluyendo una futura conexión con una API.
