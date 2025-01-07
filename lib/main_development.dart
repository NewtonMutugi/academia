import 'package:academia/app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:academia/configs/configs.dart';

// Development's entry point
void main() {
  GetIt.instance.registerSingleton<FlavorConfig>(
    FlavorConfig(
      flavor: Flavor.dev,
      appName: "Academia - Dev",
      apiBaseUrl: "http://127.0.0.1:8000",
    ),
  );
  runApp(const Academia());
}
