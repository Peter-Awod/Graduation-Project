import 'package:flutter/material.dart';
import 'package:grad_project/modules/login_screen/login_screen.dart';
import 'package:grad_project/modules/sign_up_screen/sign_up_screen.dart';
import 'package:grad_project/shared/components/components.dart';

import 'package:hexcolor/hexcolor.dart';


class StartPageScreen extends StatefulWidget {
  const StartPageScreen({Key? key}) : super(key: key);

  @override
  State<StartPageScreen> createState() => _StartPageScreenState();
}

class _StartPageScreenState extends State<StartPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[600],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    child:
                      Image(image: AssetImage('assets/images/start.png')),

                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                //Text
                Text(
                  'PNA',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 100,
                    color: Colors.white54
                  ),
                ),
                Text(
                  'Privilegiato Non Autistico',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                      color: Colors.black54,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 350,
                  height: 50,
                  // decoration: BoxDecoration(
                  //   color: HexColor('#020a75'),//must change
                  //   borderRadius: BorderRadius.circular(30),
                  // ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[200], //must change
                      elevation: 15,

                    ),
                    onPressed: () {
                      pushNavigateTo(context, LoginScreen());
                    },
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.white54, //must change
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  height: 50,
                  // decoration: BoxDecoration(
                  //   color: HexColor('#040a61'), //must change
                  //   borderRadius: BorderRadius.circular(30),
                  // ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[200], //must change
                      elevation: 15,

                    ),
                    onPressed: () {
                      pushNavigateTo(context, SignUpScreen());
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white54, //must change
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
