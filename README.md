# Proyecto Flutter - Navegación y Componentes

## Descripción
Este proyecto es una aplicación desarrollada en **Flutter** utilizando **Dart** como lenguaje de programación. Se enfoca en la implementación de rutas, navegación, gestión de formularios, vistas dinámicas y diálogos.

## Estructura del Proyecto

## Características Principales
### 1. **Navegación entre pantallas**
- Se implementa la navegación con **Navigator.pushNamed()** y **Navigator.pushReplacementNamed()** para una transición eficiente entre pantallas.
- Uso de `Hero Animation` para transiciones animadas.

### 2. **Pantalla Splash (SE APLICA EN P5)**  
- Se usa `initState()` y un `Future.delayed()` para mostrar un **Splash Screen** con un `CircularProgressIndicator`.

### 3. **Control de rutas**
- Se utilizan archivos `app_routes.dart` y `routes.dart` para controlar la navegación de forma estructurada.
- Se eliminó el alias `/` para evitar redirecciones innecesarias.

### 4. **Formularios y validaciones**
- Uso del `Form` con `GlobalKey` para validaciones en tiempo real.
- Implementación de `TextFormField` con reglas de validación personalizadas.
- Botón de validación para verificar y enviar formularios.

### 5. **Vistas dinámicas con StatefulWidgets**
- Se implementan widgets dinámicos con `setState()` para actualizar la UI en tiempo real.
- Uso de `TextEditingController` para gestionar entradas de usuario.

### 6. **Diálogos emergentes**
- Implementación de `showDialog()` para mostrar mensajes de alerta o confirmación.
- Personalización de botones dentro de los diálogos.

### **Instalar depedencias**
- `flutter pub get`
- `flutter run`




