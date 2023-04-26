import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/routes/routes.dart';

import '../../components/appbar.dart';
import '../../services/auth_service.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: const AppBarView(
        title: "Perfil",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: -5,
                      blurRadius: 25,
                      offset: Offset(0, 0),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/user.png",
                    scale: 7,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    authService.userAuth.name,
                    style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Username: ",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                          Text(
                            authService.userAuth.username,
                            style: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Email: ",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                          Text(
                            authService.userAuth.email,
                            style: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Phone: ",
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      Text(
                        authService.userAuth.phone,
                        style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Website: ",
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      Text(
                        authService.userAuth.website,
                        style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: -5,
                      blurRadius: 25,
                      offset: Offset(0, 0),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Address",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Street: ",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                          Text(
                            authService.userAuth.address.street,
                            style: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Suite: ",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                          Text(
                            authService.userAuth.address.suite,
                            style: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "City: ",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                          Text(
                            authService.userAuth.address.city,
                            style: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Zipcode: ",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                          ),
                          Text(
                            authService.userAuth.address.zipcode,
                            style: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: -5,
                      blurRadius: 25,
                      offset: Offset(0, 0),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Company",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Name: ",
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      Text(
                        authService.userAuth.company.name,
                        style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "bs: ",
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      Text(
                        authService.userAuth.company.bs,
                        style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Phrase: ",
                        style: TextStyle(color: Colors.black54, fontSize: 15),
                      ),
                      Text(
                        authService.userAuth.company.catchPhrase,
                        style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                final authService =
                    Provider.of<AuthService>(context, listen: false);
                authService.userAuth.id = 0;

                Navigator.pop(context);
                Navigator.restorablePushReplacementNamed(
                    context, PageRoutes.login);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(8)),
                child: const Text(
                  "Cerrar Sesión",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
