import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica/routes/routes.dart';
import 'package:prueba_tecnica/services/notification_service.dart';

import '../components/appbar.dart';
import '../models/PostModel.dart';
import '../services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        onTap: () {
          NotificationService.showAddPost(context);
        },
        child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: Colors.blueGrey[400],
                borderRadius: BorderRadius.circular(50)),
            child: const Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            )),
      ),
      appBar: const AppBarView(
        title: "Prueba Técnica",
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.perfil);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    const Expanded(
                      flex: 2,
                      child: Text(
                        "Bienvenido",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        authService.userAuth.name,
                        style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: Text(
                        "Mi lista de post",
                        style: TextStyle(color: Colors.blueGrey, fontSize: 17),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: SizedBox(
                child: RefreshIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.blueGrey,
                  onRefresh: () async {
                    final authServiceR =
                        Provider.of<AuthService>(context, listen: false);
                    authServiceR.getPosts();
                    NotificationService.showSnackBarSuccess(
                        "Se actualizaron los post desde la API", context);
                  },
                  child: ListView.builder(
                      itemCount: authService.posts.length,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(1),
                      itemBuilder: (BuildContext context, int index) {
                        return ScaleAnimation(
                            child: PostWidgetView(
                          post: authService.posts[index],
                          index: index,
                        ));
                      }),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PostWidgetView extends StatelessWidget {
  const PostWidgetView({
    Key? key,
    required this.post,
    required this.index,
  }) : super(key: key);

  final Post post;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.blueGrey[50],
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: InkWell(
                onTap: () {
                  final authService =
                      Provider.of<AuthService>(context, listen: false);
                  authService.postSelected = post;
                  Navigator.pushNamed(context, PageRoutes.postDetail);
                },
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      (post.id % 2 == 0)
                          ? "assets/post.jpg"
                          : "assets/post2.jpg",
                      scale: 3,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 9,
                child: InkWell(
                  onTap: () {
                    final authService =
                        Provider.of<AuthService>(context, listen: false);
                    authService.postSelected = post;
                    Navigator.pushNamed(context, PageRoutes.postDetail);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                            height: 20,
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              post.title[0].toUpperCase() +
                                  post.title.substring(1),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              post.body[0].toUpperCase() +
                                  post.body.substring(1),
                              overflow: TextOverflow.fade,
                              style: const TextStyle(
                                  color: Colors.black54, fontSize: 13),
                            )),
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    NotificationService.showDeletePost(post.id, index, context);
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.red[700],
                  ),
                ))
          ],
        ));
  }
}
