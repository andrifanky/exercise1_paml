import 'package:exercise1_paml/auth/register_page.dart';
import 'package:exercise1_paml/themes.dart';
import 'package:exercise1_paml/widgets/input_password_field.dart';
import 'package:exercise1_paml/widgets/input_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: body(),
    );
  }

  Widget body() {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(defaultMargin),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/pokemon_text_logo.png', height: 120),
                          const SizedBox(height: 20),
                          Text("Let's get started", style: h1YellowTextStyle),
                          const SizedBox(height: 20),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: regularDarkGreyBoldTextStyle,
                              children: const [
                                TextSpan(
                                  text: "There's No Sense In Going Out Of\n"
                                ),
                                TextSpan(
                                  text: 'Your Way To Get Somebody To Like You.'
                                ),
                              ]
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name', style: regularYellowMediumTextStyle),
                          const SizedBox(height: 5),
                          InputTextField(label: 'Name', icon: const Icon(Icons.person_rounded, color: kYellowColor), hint: 'Enter your name', textEditingController: _usernameController, textInputType: TextInputType.name, textInputAction: TextInputAction.next, validatorMessage: 'Please enter your name', minLength: 6),
                          const SizedBox(height: 20),
                          Text('Password', style: regularYellowMediumTextStyle),
                          const SizedBox(height: 5),
                          InputPasswordField(label: 'Password', icon: const Icon(Icons.lock_rounded, color: kYellowColor), hint: 'Enter your password', textEditingController: _passwordController, textInputType: TextInputType.text, textInputAction: TextInputAction.done, obscureText: true, validatorMessage: 'Please enter your password'),
                          const SizedBox(height: 60),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                height: 55,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(username: _usernameController.text)));
                                    }
                                  },
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30)
                                      )
                                    )
                                  ),
                                  child: Text('Sign In', style: buttonWhiteTextStyle)
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Don't have an account?"),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                                    },
                                    child: Text('Sign Up', style: regularYellowMediumTextStyle)
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
