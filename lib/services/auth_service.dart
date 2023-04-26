import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart';
import 'package:prueba_tecnica/models/PostModel.dart';

import '../models/UserModel.dart';
import 'base_service.dart';

/* AuthService: service to get all the data necessary */
class AuthService extends ChangeNotifier {
  final baseService = BaseService();

  AuthService() {
    getUsers();
  }

  final String _urlUsers = GlobalConfiguration().getValue('users');
  final String _urlPosts = GlobalConfiguration().getValue('posts');

  List<User> users = [];
  List<Post> posts = [];
  User userAuth = User(
      id: 0,
      name: "name",
      username: "",
      email: "",
      address: Address(
          street: "",
          suite: "",
          city: "",
          zipcode: "",
          geo: Geo(lat: "", lng: "")),
      phone: "",
      website: "",
      company: Company(name: "", catchPhrase: "", bs: ""));

  Post postSelected = Post(userId: 0, id: 0, title: "", body: "");

  /*  
  Function to obtain all the users from API 
  */
  Future<void> getUsers() async {
    var resp = await baseService.baseGet(_urlUsers);
    final usersResp = userFromJson(resp);
    users = [];
    users.addAll(usersResp);
    notifyListeners();
  }

  /*  
    Function login in app.
    email = email from API
    pass = username from API
   */

  Future<bool> loginAuth(email, pass) async {
    userAuth = users.singleWhere(
        (element) => element.email == email && element.username == pass,
        orElse: () => User(
            id: 0,
            name: "",
            username: "",
            email: "",
            address: Address(
                street: "",
                suite: "",
                city: "",
                zipcode: "",
                geo: Geo(lat: "", lng: "")),
            phone: "",
            website: "",
            company: Company(bs: "", catchPhrase: "", name: "")));

    getPosts();
    notifyListeners();

    if (userAuth.id != 0) {
      return true;
    } else {
      return false;
    }
  }

  /*  
    Function to get all post from user logged.
   */

  Future<void> getPosts() async {
    var resp =
        await baseService.baseGetWithParams(_urlPosts, userAuth.id.toString());
    final postResp = postFromJson(resp);
    posts = [];
    posts.addAll(postResp);
    notifyListeners();
  }

  /*  
    Function to add new post from user logged.
  */

  Future<void> addPost(title, body) async {
    final Map<String, dynamic> data = {
      "title": title,
      "body": body,
      "userId": userAuth.id
    };

    var resp = await baseService.basePost(_urlPosts, data);
    final Map<String, dynamic> decodedResp = json.decode(resp);

    posts.add(Post(
        userId: decodedResp['userId'],
        id: decodedResp["id"],
        title: decodedResp["title"],
        body: decodedResp["body"]));

    notifyListeners();
  }

  /*  
    Function to delete  post from user logged.
  */

  Future<void> deletePost(String postId, int index) async {
    var resp = await baseService.baseDelete("$_urlPosts/$postId");
    final Map<String, dynamic> decodedResp = json.decode(resp);

    posts.removeAt(index);

    notifyListeners();
  }
}
