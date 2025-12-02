# 🐱 Gato App -- Flutter + CATAAS API

Aplicación móvil desarrollada en **Flutter** que consume la API pública
**CATAAS** para mostrar imágenes y GIFs de gatos de manera aleatoria.
Además, permite generar imágenes con texto personalizado.

<h3 align="center">Gatos App 🐱</h3>

| Botón Gato Random | Botón GIF Gato | Botón Gato Texto |
|-------------------|----------------|------------------|
| <img src="https://github.com/user-attachments/assets/eb116aab-c0c8-491b-af1a-add8d4817a1b" width="100%"> | <img src="https://github.com/user-attachments/assets/143f00f8-c53b-425b-b802-9f6dc79ceb79" width="100%"> | <img src="https://github.com/user-attachments/assets/858248c4-ea01-4ae9-813d-ac09c31484de" width="100%"> |



## 📱 Características

-   Mostrar imágenes aleatorias de gatos\
-   Mostrar GIFs aleatorios\
-   Generar un gato con texto personalizado\
-   Evitar caché usando timestamps\
-   Compatible con Android, iOS y Web

## 🚀 Tecnologías utilizadas

-   Flutter 3.x\
-   Dart\
-   HTTP package\
-   API CATAAS: https://cataas.com/

## 📦 Instalación

``` bash
git clone https://github.com/AlmeidaKevin/flutter_application_4.git
cd flutter_application_4.git
flutter pub get
flutter run
```

## 🔧 Dependencias principales

``` yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.2.0
```

## 🧩 Estructura del Proyecto

    lib/
    │── main.dart         
    │── widgets/          
    │── services/         
    assets/               

## 🧪 Compilar APK

``` bash
flutter build apk --release
```

## 🧠 Cómo funciona la API CATAAS

  Acción                URL
  --------------------- ----------------------------------
  Imagen random         https://cataas.com/cat
  GIF random            https://cataas.com/cat/gif
  Texto personalizado   https://cataas.com/cat/says/Hola
  Modo JSON             https://cataas.com/cat?json=true

## 🧑‍💻 Código principal (main.dart)


``` dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gato App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const GatoHomePage(),
    );
  }
}

class GatoHomePage extends StatefulWidget {
  const GatoHomePage({super.key});

  @override
  State<GatoHomePage> createState() => _GatoHomePageState();
}

class _GatoHomePageState extends State<GatoHomePage> {
  String imageUrl = "https://cataas.com/cat";
  bool isGif = false;
  final TextEditingController textoController = TextEditingController();

  /// Cargar imagen random
  void cargarGato() {
    setState(() {
      imageUrl =
          "https://cataas.com/cat?time=${DateTime.now().millisecondsSinceEpoch}";
    });
  }

  void cargarGif() {
    setState(() {
      imageUrl =
          "https://cataas.com/cat/gif?time=${DateTime.now().millisecondsSinceEpoch}";
    });
  }

  void cargarGatoConTexto() {
    final texto = textoController.text.trim();
    if (texto.isEmpty) return;

    final safeText = Uri.encodeComponent(texto);

    setState(() {
      imageUrl =
          "https://cataas.com/cat/says/$safeText?time=${DateTime.now().millisecondsSinceEpoch}";
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gatos App 🐱"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Imagen desde CATAAS
              Image.network(
                imageUrl,
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (c, e, s) =>
                    const Text("Error al cargar la imagen"),
              ),

              const SizedBox(height: 20),

              // Botones
              ElevatedButton(
                onPressed: cargarGato,
                child: const Text("Gato Random"),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: cargarGif,
                child: const Text("GIF de Gato"),
              ),

              const SizedBox(height: 20),

              // Texto
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: textoController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Texto para el gato",
                  ),
                ),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: cargarGatoConTexto,
                child: const Text("Gato con Texto"),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
```
