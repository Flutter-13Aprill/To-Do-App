import 'dart:ui';

import 'package:flutter/widgets.dart';

class category {
  final String Categoryname;
  final String categoryimage;
  final Color categorycolor;
  

  category({
    required this.Categoryname,
    required this.categoryimage,
    required this.categorycolor,
  });
}

final List<category> categoris = [
  category(
    Categoryname: "Grocery",
    categoryimage: "images/bread 1.png",
    categorycolor: Color.fromRGBO(204, 255, 128, 1),
  ),
  category(
    Categoryname: "Work",
    categoryimage: "images/bagwork.png",
    categorycolor: Color.fromRGBO(255, 150, 128, 1),
  ),
  category(
    Categoryname: "Sport",
    categoryimage: "images/sport.png",
    categorycolor: Color.fromRGBO(128, 255, 255, 1),
  ),
  category(
    Categoryname: "Design",
    categoryimage: "images/game.png",
    categorycolor: Color.fromRGBO(128, 255, 217, 1),
  ),
  category(
    Categoryname: "University",
    categoryimage: "images/univ.png",
    categorycolor: Color.fromRGBO(128, 156, 255, 1),
  ),
  category(
    Categoryname: "Social",
    categoryimage: "images/megaphone 1.png",
    categorycolor: Color.fromRGBO(255, 128, 235, 1),
  ),
  category(
    Categoryname: "Music",
    categoryimage: "images/music .png",
    categorycolor: Color.fromRGBO(252, 128, 255, 1),
  ),
  category(
    Categoryname: "Health",
    categoryimage: "images/heartbeat.png",
    categorycolor: Color.fromRGBO(128, 255, 163, 1),
  ),
  category(
    Categoryname: "Movie",
    categoryimage: "images/video-camera.png",
    categorycolor: Color.fromRGBO(128, 209, 255, 1),
  ),
  category(
    Categoryname: "Home",
    categoryimage: "images/home.png",
    categorycolor: Color.fromRGBO(255, 204, 128, 1),
  ),
  category(
    Categoryname: "Create New",
    categoryimage: "images/add.png",
    categorycolor: Color.fromRGBO(128, 255, 209, 1),
  ),
];
