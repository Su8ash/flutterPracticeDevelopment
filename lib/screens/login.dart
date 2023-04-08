import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff01A651),
              Color(0xff31B14A),
              Color(0xff86C440),
              //add more colors
            ]),
            borderRadius: BorderRadius.circular(5),
            // boxShadow: <BoxShadow>[
            //   BoxShadow(
            //       color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
            //       blurRadius: 5) //blur radius of shadow
            // ],
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              // shadowColor: Colors.transparent,
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              //make color or elevated button transparent
            ),
            onPressed: () {
              // print("You pressed Elevated Button");
              context.go("/area");
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
              child: Text(
                "Login With Whatsapp",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
