import 'package:exercise1_paml/auth/login_page.dart';
import 'package:exercise1_paml/themes.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(defaultMargin),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text('Pokedex.', style: h1YellowTextStyle),
            const SizedBox(height: 30),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: regularDarkGreyTextStyle,
                children: const [
                  TextSpan(
                    text: 'Welcome to Pokedex\n'
                  ),
                  TextSpan(
                    text: 'You can find your favorite pokemon here'
                  ),
                ]
              ),
            ),
            const Spacer(),
            Image.asset('assets/images/pokemon_logo.png', height: 160),
            const Spacer(),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              backgroundColor: kYellowColor,
              child: const Icon(Icons.arrow_forward_rounded),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
