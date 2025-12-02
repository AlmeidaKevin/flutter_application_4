# 🐱 Gato App -- Flutter + CATAAS API

Aplicación móvil desarrollada en **Flutter** que consume la API pública
**CATAAS** para mostrar imágenes y GIFs de gatos de manera aleatoria.
Además, permite generar imágenes con texto personalizado.

<h3 align="center">Gatos App 🐱</h3>

<p align="center">

  <div>
    <p align="center"><b>Botón Gato Random</b></p>
    <img src="https://github.com/user-attachments/assets/eb116aab-c0c8-491b-af1a-add8d4817a1b" width="30%">
  </div>

  <div>
    <p align="center"><b>Botón GIF Gato</b></p>
    <img src="https://github.com/user-attachments/assets/143f00f8-c53b-425b-b802-9f6dc79ceb79" width="30%">
  </div>

  <div>
    <p align="center"><b>Botón Gato Texto</b></p>
    <img src="https://github.com/user-attachments/assets/858248c4-ea01-4ae9-813d-ac09c31484de" width="30%">
  </div>

</p>





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
git clone https://github.com/tu-usuario/gato_app.git
cd gato_app
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

(Contenido del archivo main.dart aquí)

## 📄 Licencia

MIT

## ❤️ Autor

Desarrollado por *Tu Nombre*
