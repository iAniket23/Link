import 'package:code/backend/auth_methods.dart';
import 'package:code/responsive/mobile_screen_layout.dart';
import 'package:code/responsive/responsive_screen_layout.dart';
import 'package:code/responsive/web_screen_layout.dart';
import 'package:code/screen/login_UI.dart';
import 'package:code/utils/colors.dart';
import 'package:code/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  
  void navigateTologin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void navigateToResponsiveLayout() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ResponsiveLayout(
            mobileScreenLayout: MobileScreenLayout(),
            webScreenLayout: WebScreenLayout()),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _descriptionController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(children: [
            //image logo
            const SizedBox(height: 8),
            Image.asset(
              'assets/Link_logo.png',
              height: 200,
              width: 220,
            ),
            // text for username
            TextFieldInput(
                textEditingController: _usernameController,
                hintText: 'Enter your username',
                textInputType: TextInputType.text),
            const SizedBox(height: 16),

            //text for email
            TextFieldInput(
                textEditingController: _emailController,
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress),
            const SizedBox(height: 16),

            // text for password
            TextFieldInput(
              textEditingController: _passwordController,
              hintText: 'Enter your password',
              textInputType: TextInputType.text,
              isPass: true,
            ),
            const SizedBox(height: 16),

            // text for bio
            TextFieldInput(
              textEditingController: _descriptionController,
              hintText: 'Enter your bio',
              textInputType: TextInputType.multiline,
            ),
            const SizedBox(height: 16),

            //signup button
            const SizedBox(height: 16),
            InkWell(
              onTap: () async {
                String result = await AuthMethods().signUpUser(
                    email: _emailController.text,
                    password: _passwordController.text,
                    username: _usernameController.text,
                    description: _descriptionController.text);
                navigateToResponsiveLayout();
              },
              child: Container(
                child: const Text('Sign Up'),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: buttonColor),
              ),
            ),
            Flexible(child: Container(), flex: 2),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text("Already have an account?"),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                ),
                GestureDetector(
                  onTap: navigateTologin,
                  child: Container(
                    child: const Text("Login",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
