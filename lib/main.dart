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
