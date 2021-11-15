import 'package:app_jokenpo/jogo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xeff6c223),
        body: Center(
          child: Container(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Image.asset(
                    "assets/logo.png",
                    width: 300,
                  ),
                ),
                // ignore: deprecated_member_use
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(   //Elimina a seta para voltar.
                      context,
                      MaterialPageRoute(builder: (context) => Jogo()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: Image.asset(
                    'assets/play.png',
                    width: 250,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: GestureDetector(
                        child: Image.asset(
                          "assets/home.png",
                          width: 80,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: GestureDetector(
                        child: Image.asset(
                          "assets/trophy.png",
                          width: 80,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: GestureDetector(
                        child: Image.asset(
                          "assets/buy.png",
                          width: 95,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
