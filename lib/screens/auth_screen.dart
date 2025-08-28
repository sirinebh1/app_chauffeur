import 'package:app_chauffeur1/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:app_chauffeur1/screens/mission_screen.dart';


class AuthScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(

                child:  Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                ),
              ),
              SizedBox(height: 40),
              Text("Identifiant",style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Saisir identifiant',
                ),
              ),
              SizedBox(height: 20),
              Text("Mot de passe",style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Saisir mot de passe',
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CustomScaffold()),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5f51e9
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    "Se connecter",
                    style: TextStyle(color:Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
