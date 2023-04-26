import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/appbar.dart';
import '../../models/PostModel.dart';
import '../../routes/routes.dart';
import '../../services/auth_service.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    final post = Provider.of<AuthService>(context).postSelected;

    return Scaffold(
      appBar: AppBarView(
        title: "Post #${post.id}",
      ),
      body: Center(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: -4,
                  blurRadius: 25,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        (post.id % 2 == 0)
                            ? "assets/post.jpg"
                            : "assets/post2.jpg",
                        scale: 2,
                      )),
                  Text(
                    post.title[0].toUpperCase() + post.title.substring(1),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    post.body,
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(color: Colors.blueGrey, fontSize: 15),
                  ),
                ])),
      ),
    );
  }
}
