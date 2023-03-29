import 'package:exercise1_paml/themes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.name
  });

  final String name;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      // appBar: appBar(),
      body: body(),
    );
  }

  // PreferredSizeWidget appBar() {
  //   return AppBar(
  //     toolbarHeight: 80,
  //     backgroundColor: kWhiteColor,
  //     elevation: 0,
  //     title: RichText(
  //       text: TextSpan(
  //         children: [
  //           TextSpan(text: 'Hallo, ', style: regularBlackBoldTextStyle),
  //           TextSpan(text: widget.name, style: regularBlueBoldTextStyle),
  //         ]
  //       )
  //     ),
  //     actions: const [
  //       Padding(
  //         padding: EdgeInsets.all(13),
  //         child: CircleAvatar(
  //           radius: 28,
  //           backgroundImage: AssetImage('assets/images/ash_profile.png')
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget body() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Hallo, ', style: regularBlackBoldTextStyle),
                      TextSpan(text: widget.name, style: regularBlueBoldTextStyle),
                    ]
                  )
                ),
                const Spacer(),
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/ash_profile.png')
                ),
              ],
            ),
            Text('Pokedex', style: h1YellowTextStyle),
            const SizedBox(height: 10),
            searchField(),
            Expanded(
              child: ListView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchField() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search_rounded),
        hintText: 'Search Pokemon',
        fillColor: Colors.grey.shade200,
        filled: true,
        isDense: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10)
        ),
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search
    );
  }
}
