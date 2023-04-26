import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../components/textfield.dart';
import 'auth_service.dart';

class NotificationService {
  static showSnackBarError(String message, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.of(context).pop(true);
          });
          return Stack(
            children: [
              AlertDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  title: const Text(
                    "Error",
                    style: TextStyle(color: Colors.white),
                  ),
                  content: Text(message,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 19)),
                  backgroundColor: Colors.red),
              FractionalTranslation(
                translation: const Offset(-0.00, -0.00),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Lottie.network(
                        "https://assets1.lottiefiles.com/packages/lf20_ddxv3rxw.json",
                        height: 150)),
              ),
            ],
          );
        },
        barrierDismissible: true);
  }

  static showSnackBarSuccess(String message, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.of(context).pop(true);
          });
          return Stack(
            children: [
              AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                title: const Text(
                  "Éxito",
                  style: TextStyle(color: Colors.white),
                ),
                content: Text(message,
                    style: const TextStyle(color: Colors.white, fontSize: 19)),
                backgroundColor: Colors.green,
              ),
              FractionalTranslation(
                translation: Offset(-0.00, -0.00),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Lottie.network(
                        "https://assets3.lottiefiles.com/packages/lf20_lk80fpsm.json",
                        height: 150)),
              ),
            ],
          );
        },
        barrierDismissible: true);
  }

  static showAddPost(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController bodyController = TextEditingController();
    showDialog(
        context: context,
        useSafeArea: true,
        builder: (context) {
          return AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              title: const Text(
                "Agregar Nuevo Post",
                style: TextStyle(color: Colors.blueGrey),
              ),
              scrollable: true,
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(color: Colors.white),
                  ),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.black38),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(color: Colors.blue),
                  ),
                  child: const Text('Añadir'),
                  onPressed: () async {
                    final authService =
                        Provider.of<AuthService>(context, listen: false);

                    var resp = await authService.addPost(
                        titleController.text, bodyController.text);

                    Navigator.pop(context);

                    showSnackBarSuccess("Post agregado", context);
                  },
                ),
              ],
              content: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFieldAuth(
                      hintText: "Título",
                      controller: titleController,
                      textInputType: TextInputType.text,
                      tipo: "text",
                    ),
                    SizedBox(
                      height: 100,
                      child: TextFieldAuth(
                        hintText: "Cuerpo",
                        controller: bodyController,
                        textInputType: TextInputType.multiline,
                        tipo: "text",
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.white);
        },
        barrierDismissible: true);
  }

  static showDeletePost(int postId, int index, BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Stack(
            children: [
              AlertDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  title: const Text(
                    "Eliminar Post",
                    style: TextStyle(color: Colors.blue),
                  ),
                  actions: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(color: Colors.white),
                      ),
                      child: const Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.black38),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(color: Colors.blueGrey),
                      ),
                      child: const Text('Sí'),
                      onPressed: () async {
                        final authService =
                            Provider.of<AuthService>(context, listen: false);

                        authService.deletePost(postId.toString(), index);
                        Navigator.pop(context);

                        showSnackBarSuccess("Post eliminado.", context);
                      },
                    ),
                  ],
                  content: const Text("¿Deseas eliminar este post?",
                      style: TextStyle(color: Colors.black54, fontSize: 19)),
                  backgroundColor: Colors.white),
            ],
          );
        },
        barrierDismissible: true);
  }
}
