import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upwork_fruit_app/controller/AreaController.dart';
import 'package:upwork_fruit_app/controller/HomeController.dart';
import 'package:upwork_fruit_app/screens/area.dart';
import 'package:upwork_fruit_app/screens/home.dart';
import 'package:upwork_fruit_app/screens/login.dart';

void main() {
  runApp(const MyApp());
}

/// The route configuration.
final GoRouter _router = GoRouter(
  initialLocation: '/login',
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        // return AddRecipeScreen();
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/area',
      builder: (BuildContext context, GoRouterState state) {
        // return AddRecipeScreen();
        return AreaScreen();
      },
    ),
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        // GoRoute(
        //   path: 'details',
        //   builder: (BuildContext context, GoRouterState state) {
        //     return const DetailScreen();
        //   },
        // ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Dish Detail Controller
    Get.put(AreaController());
    Get.put(HomeController());
    // Get.put(BottomNavbarController());

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      routerConfig: _router,
    );
  }
}
