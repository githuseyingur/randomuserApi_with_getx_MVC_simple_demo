import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_task/routes/app_router.dart';

void main(){
  runApp(MyApp());
}
final router = AppRouter();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp.router(
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}