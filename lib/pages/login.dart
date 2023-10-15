import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(

          children: [
            Spacer(),
            SvgPicture.asset(
              'assets/images/prpty-logo.svg',
              //width: Get.width * 0.09,
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            TextFormField(
              controller: loginController.emailController.value,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white24), // Set the focused border color to white
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white24), // Set the enabled border color to white
                ),
                filled: true,
                fillColor: Colors.black12, // Set the filled color to grey
                hintText: 'Phone number, Username, Email Id',
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
            SizedBox(height: 25),
            TextFormField(
              controller: loginController.passwordController.value,
              obscureText: passwordVisible,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(passwordVisible
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    setState(
                      () {
                        passwordVisible = !passwordVisible;
                      },
                    );
                  },
                ),
                hintText: 'Password',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white24), // Set the focused border color to white
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white24), // Set the enabled border color to white
                ),
                filled: true,
                fillColor: Colors.black12,
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
            SizedBox(height: Get.height * 0.017),
            Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Text(
                  'Forgot Password ?',
                  style: TextStyle(color: Colors.white38),
                )),
            SizedBox(height: Get.height * 0.02),
            SizedBox(
              height: Get.height * 0.050,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[400],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {
                    loginController.loginApi();
                  },
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  )),
            ),
            SizedBox(height: Get.height * 0.03),
            Row(
              children:[
                Expanded(
                  child: Divider(
                    color: Colors.white10,
                    thickness: 1.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.white,fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.white10,
                    thickness: 1.5,
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/facebook.svg',width: Get.width*0.07,
                ),
                SizedBox(width: Get.width * 0.06),
                SvgPicture.asset(
                  'assets/images/apple.svg',width: Get.width*0.07,
                ),
                SizedBox(width: Get.width * 0.06),
                SvgPicture.asset(
                  'assets/images/gmail.svg',width: Get.width*0.07,
                ),
              ],
            ),
            Spacer(),
            Divider(
              color: Colors.white10,
              thickness: 1.5,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an Account ? ",
                    style: TextStyle(
                      color: Colors.white60,  // Change the color as needed
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: "Sign In",
                    style: TextStyle(
                      color: Colors.teal[200],
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
