import 'package:exercise1_paml/themes.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
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
            // Expanded(
            //   child: Image.asset(''),
            // ),
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: kYellowColor,
              child: const Icon(Icons.arrow_forward_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
