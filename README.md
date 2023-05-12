# CRUD
# Marco Castañeda

<em> CRUD </em>

Aplicación hecha para iOS y Android con Flutter. 📱 🤖
- Flutter 3.0.0
- Dart 2.17.0

A continuación seguir los siguientes pasos para correr la aplicación: 👨🏽‍💻

1. Correr el siguiente comando para asegurar que Flutter este correctamente instalado: "flutter doctor"

Debe de salir todos con un check:
[✓] Flutter (Channel stable, 3.0.0, on macOS 13.2.1 22D68 darwin-arm, locale en-MX)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.0)
[✓] Xcode - develop for iOS and macOS (Xcode 14.3)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2020.3)
[✓] VS Code (version 1.77.0)
[✓] Connected device (3 available)
[✓] HTTP Host Availability

2. Debe de clonar este repositorio.
3. En el archivo pubspect.yaml correr "flutter pub get" para descargar dependencias.
4. Una vez descargadas las dependencias correr el comando "flutter run" selecionando un dispositivo para compilar. En este caso puede ser iOS o Android.

* Para el ejemplo con el servidor y la lista de datos, se uso la APi sujerida: https://jsonplaceholder.typicode.com/.
Esta API el POST y DELETE, lo hace, pero no se reflejan, ya que la API muestra siempre 100 posts, al momento de hacer POST desde la app, se añade y le asigna un ID en 101, pero al recargar la lista, muestra siempre los mismos.

* El usuario para acceder a la app es el email y el username (como contraseña) de cualquier usuario de los que tiene la api, dejo unos ejemplos:

- email: Sincere@april.biz
- password (username): Bret

- email: Shanna@melissa.tv
- password (username): Antonette

- email: Nathan@yesenia.net
- password (username): Samantha

* Una vez iniciada la sesión muestra los posts relacionados al usuario con el que inicio.
* Apartir de aquí podremos agregar post, eliminarlos y verlos.
* También podemos ver una pequeña pagina con toda la información del usuario

Como material extra dejo estos videos para corroborrar la funcionalidad en iOS y Android:

📱 iOS: https://1drv.ms/v/s!AkPoPKLmPpFGkvlDcymvzcuvUZrGvg?e=ux4CZf

🤖 Android: https://1drv.ms/v/s!AkPoPKLmPpFGkvlELHPSxg0ig88EPA?e=fDgsfp


Saludos y muchas gracias. 💻
