import 'package:flutter/material.dart';
import 'package:todo/global/global.dart';
import 'package:todo/helpers/uihelper.dart';
import 'package:todo/screens/mobile_screens/homescreen.dart';
import 'package:todo/screens/mobile_screens/loginscreen.dart';
import 'package:todo/screens/mobile_screens/wrapper.dart';
import 'package:todo/services/loginservices.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();

  bool isObscure = true;

  signup() async {
    if (_namecontroller.text.length > 1 &&
        _emailcontroller.text != '' &&
        _passwordcontroller != '') {
      UIHelper.LoadingBlock(context: context);
      String result = await LoginServices.signupWithEmailId(
          name: _namecontroller.text,
          emailid: _emailcontroller.text,
          password: _passwordcontroller.text);
      Navigator.pop(context);
      if (result == 'success') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MobileWrapper()));
      } else {
        UIHelper.showSnackBar(context: context, content: result);
      }
    } else {
      UIHelper.showSnackBar(context: context, content: 'Invalid Entry');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text('Sign In'),
                    ),
                  ],
                ),
                const Expanded(
                  flex: 1,
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
                  flex: 2,
                  child: Column(
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _namecontroller,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                          hintText: 'Your Name',
                          labelText: 'Name',
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
                        controller: _emailcontroller,
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
                        controller: _passwordcontroller,
                        obscureText: isObscure,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          hintText: '*********',
                          labelText: 'Your Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (isObscure == true)
                                isObscure = false;
                              else
                                isObscure = true;
                              setState(() {});
                            },
                            icon: Icon(
                              ((isObscure == true)
                                  ? (Icons.visibility_off_rounded)
                                  : (Icons.visibility_rounded)),
                              color: Colors.white,
                            ),
                          ),
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
                      FilledButton(
                        onPressed: () {
                          signup();
                        },
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
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
        ),
      ),
    );
  }
}
