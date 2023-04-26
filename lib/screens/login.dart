import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/routes/routes.dart';
import 'package:prueba_tecnica/services/notification_service.dart';

import '../components/textfield.dart';
import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController? _emailController = TextEditingController();
  final TextEditingController? _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: Form(
          key: _formKey,
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.70,
              decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: -4,
                      blurRadius: 25,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FadedScaleAnimation(
                    child: Image.asset(
                      "assets/logo.png",
                      scale: 3,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FadedScaleAnimation(
                    child: const Text(
                      "Ingresa tus datos",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldAuth(
                    hintText: "Correo",
                    controller: _emailController,
                    textInputType: TextInputType.emailAddress,
                    tipo: "text",
                  ),
                  TextFieldAuth(
                    hintText: "Contraseña",
                    controller: _passwordController,
                    textInputType: TextInputType.text,
                    tipo: "password",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FadedScaleAnimation(
                    child: InkWell(
                      onTap: () async {
                        final authService =
                            Provider.of<AuthService>(context, listen: false);
                        if (_formKey.currentState!.validate()) {
                          final bool resp = await authService.loginAuth(
                              _emailController!.text,
                              _passwordController!.text);

                          if (resp) {
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacementNamed(
                                context, PageRoutes.home);
                          } else {
                            // ignore: use_build_context_synchronously
                            NotificationService.showSnackBarError(
                                "Los datos que ingresaste son incorrectos. Intenta de nuevo.",
                                context);
                          }
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: -2,
                                blurRadius: 15,
                                offset: Offset(0, 3),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "Iniciar Sesión",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
