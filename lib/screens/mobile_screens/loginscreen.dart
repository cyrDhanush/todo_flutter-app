import 'package:flutter/material.dart';
import 'package:todo/global/global.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Todo;',
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      hintText: 'example@gmail.com',
                      labelText: 'Email Id',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: themeColor,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: passwordcontroller,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText: '*********',
                      labelText: 'Your Password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: themeColor,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Text('By Dhanush'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
