import 'package:flutter/material.dart';

import '../routes/routes.dart';

class AppBarView extends StatelessWidget implements PreferredSizeWidget {
  const AppBarView({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title),
          InkWell(
            onTap: () {
              if (title != "Perfil") {
                Navigator.pushNamed(context, PageRoutes.perfil);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14)),
              child: Image.asset(
                'assets/logo.png',
                scale: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
