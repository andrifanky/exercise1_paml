import 'package:exercise1_paml/themes.dart';
import 'package:exercise1_paml/widgets/input_confirm_password_field.dart';
import 'package:exercise1_paml/widgets/input_password_field.dart';
import 'package:exercise1_paml/widgets/input_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: appBar(),
      body: body(),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: kWhiteColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: kYellowColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child: const Icon(Icons.arrow_back_rounded),
        ),
      ),
    );
  }

  Widget body() {
    return SizedBox(
      width: double.infinity,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(defaultMargin),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage('assets/images/pokemon.jpeg'),
                        ),
                        const SizedBox(height: 20),
                        Text('Register', style: h1YellowTextStyle),
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
                        const SizedBox(height: 15),
                        Text('Email', style: regularYellowMediumTextStyle),
                        const SizedBox(height: 5),
                        InputTextField(label: 'Email', icon: const Icon(Icons.email_rounded, color: kYellowColor), hint: 'Enter your email', textEditingController: _emailController, textInputType: TextInputType.emailAddress, textInputAction: TextInputAction.next, validatorMessage: 'Please enter your email', minLength: 0),
                        const SizedBox(height: 15),
                        Text('Password', style: regularYellowMediumTextStyle),
                        const SizedBox(height: 5),
                        InputPasswordField(label: 'Password', icon: const Icon(Icons.lock_rounded, color: kYellowColor), hint: 'Enter your password', textEditingController: _passwordController, textInputType: TextInputType.text, textInputAction: TextInputAction.done, obscureText: true, validatorMessage: 'Please enter your password'),
                        const SizedBox(height: 15),
                        Text('Re-Password', style: regularYellowMediumTextStyle),
                        const SizedBox(height: 5),
                        InputConfirmPasswordField(label: 'Re-Password', icon: const Icon(Icons.lock_rounded, color: kYellowColor), hint: 'Re-Enter your password', textEditingController: _passwordController, confirmTextEditingController: _rePasswordController, textInputType: TextInputType.text, textInputAction: TextInputAction.done, obscureText: true, validatorMessage: 'Please confirm your password'),
                        const SizedBox(height: 40),
                        SizedBox(
                          height: 55,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // _formKey.currentState!.save();
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
                            child: Text('Register', style: buttonWhiteTextStyle)
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
