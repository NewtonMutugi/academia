import 'package:hive/hive.dart';
import 'package:get/get.dart';
import "package:academia/constants/common.dart";
import 'package:http/http.dart';
import "dart:convert";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String? name;

  @HiveField(1, defaultValue: 0.0)
  double? gpa;

  @HiveField(2)
  String? admno;

  @HiveField(3)
  String? password;

  @HiveField(4)
  String? idno;

  @HiveField(5)
  String? gender;

  @HiveField(6)
  String? address;

  @HiveField(7)
  String? email;

  @HiveField(8)
  String? dateOfBirth;

  @HiveField(9)
  String? campus;

  @HiveField(10)
  String? programme;

  @HiveField(11)
  String? completedUnits;

  @HiveField(12)
  String? status;

  @HiveField(13)
  String? amountBilled;

  @HiveField(14)
  String? amountPaid;

  @HiveField(15)
  String? balance;

  // To json object
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'admno': admno,
      'password': password,
      'gpa': gpa,
    };
  }

  // from json
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        gpa = json['gpa'],
        password = json['password'],
        admno = json['admno'];

  Map<String, dynamic> toModel() {
    return {
      'username': admno,
      'password': password,
    };
  }

  User(); // Explicitly does nothing to silence warnings

  // Login a user
  Future<bool> login(String username, String password) async {
    // Make API request to authenticate user
    try {
      final url = Uri.parse("$urlPrefix/login");
      debugPrint(url.toString());
      final headers = {"Content-type": "application/json"};

      // Send a request
      final response = await post(
        url,
        headers: headers,
        body: json.encode({"username": username, "password": password}),
      );

      debugPrint("Login status code: ${response.statusCode}");

      // Check response status
      if (response.statusCode == 200) {
        // Authentication successful
        return true;
      }
    } catch (error) {
      // Handle network or API errors
      debugPrint("Error during login: ${error.toString()}");
    }
    return false;
  }

  // Retrieves user details from the api
  Future<User> getUserDetails(String username, String password) async {
    User newUser = User();

    try {
      final url = Uri.parse("$urlPrefix/api/user");
      final headers = {"Content-type": "application/json"};

      final response = await get(
        url,
        headers: headers,
      );

      debugPrint("Get user details status: ${response.statusCode}");

      // Check response status
      if (response.statusCode == 200) {
        debugPrint("Success");
        debugPrint(jsonDecode(response.body));
      } else {
        debugPrint("Error getting user info");
        Get.snackbar(
          "Server Error",
          "There was an error trying to retrieve your details",
          icon: const Icon(
            CupertinoIcons.xmark_circle,
            color: Colors.red,
          ),
        );
      }
    } catch (e) {
      debugPrint("Error");
    }

    return newUser;
  }
}
