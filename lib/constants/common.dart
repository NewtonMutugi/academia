// const String urlPrefix = "https://daystar-backend-atrocious-jpg.vercel.app";
// For local development

import 'package:academia/models/user.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:magnet/magnet.dart';

const String urlPrefix = "https://daystar-backend.onrender.com";
const String dbName = "appDB";
User user = User();
late Box appDB;
late Magnet magnet;

extension StringExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String title() {
    return replaceAll(RegExp(' +'), ' ')
        .split(' ')
        .map((str) => str.toCapitalized())
        .join(' ');

    // return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

const TextStyle normal = TextStyle(); // Default font

const TextStyle h1 = TextStyle(
  fontFamily: "nunito",
  fontWeight: FontWeight.bold,
  fontSize: 45,
);

const TextStyle h2 = TextStyle(
  fontFamily: "nunito",
  fontWeight: FontWeight.bold,
  fontSize: 35,
);

const TextStyle h3 = TextStyle(
  fontFamily: "nunito",
  fontWeight: FontWeight.bold,
  fontSize: 30,
);

const TextStyle h4 = TextStyle(
  fontFamily: "nunito",
  fontWeight: FontWeight.bold,
  fontSize: 25,
);

const TextStyle h5 = TextStyle(
  fontFamily: "nunito",
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

const TextStyle h6 = TextStyle(
  fontFamily: "nunito",
  fontWeight: FontWeight.bold,
  fontSize: 15,
);