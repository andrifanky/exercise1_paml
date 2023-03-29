// import 'package:dio/dio.dart';
// import 'package:exercise1_paml/models/pokemon.dart';
import 'dart:convert';

import 'package:exercise1_paml/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  // Future<Pokemon> fetchPokemon() async {
  //   final response = await Dio().get('https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20');

  //   if (response.statusCode == 200) {
  //     return Pokemon.fromJson(response.data);
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  Future fetchPokemon() async {
    final String response = await rootBundle.loadString('assets/json/pokemon.json');
    return await json.decode(response);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: body(),
    );
  }

  Widget body() {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: FutureBuilder(
                future: fetchPokemon(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(defaultMargin),
                      children: snapshot.data.map<Widget>((e) {
                        return Card(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: kGreenColor,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Image.network(e['image_src']),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("#${e['number']}", style: regularDarkGreyTextStyle),
                                          const SizedBox(width: 5),
                                          Expanded(
                                            child: Text("${e['name'][0].toUpperCase()}${e['name'].substring(1)}", style: regularBlackBoldTextStyle),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: e['type'].map<Widget>((e2) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: typeColor(e2),
                                              borderRadius: BorderRadius.circular(5)
                                            ),
                                            padding: const EdgeInsets.all(3),
                                            margin: const EdgeInsets.only(right: 4),
                                            child: Text(e2, style: smallWhiteTextStyle),
                                          );
                                        }).toList(),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(e['description'], style: smallDarkGreyTextStyle),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                }),
              ),
              // child: FutureBuilder<Pokemon>(
              //   future: fetchPokemon(),
              //   builder: ((context, snapshot) {
              //     if (snapshot.hasData) {
              //       return ListView(
              //         padding: const EdgeInsets.all(defaultMargin),
              //         children: snapshot.data!.results.map((e) {
              //           return Card(
              //             child: Container(
              //               padding: const EdgeInsets.all(10),
              //               child: Row(
              //                 children: [
              //                   Text(e.name)
              //                 ],
              //               ),
              //             ),
              //           );
              //         }).toList(),
              //       );
              //     } else if (snapshot.hasError) {
              //       return Text('${snapshot.error}');
              //     }
              //     return const CircularProgressIndicator();
              //   }),
              // ),
            ),
          ),
        ],
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

  Color typeColor(String type) {
    if (type == 'Grass') {
      return kGreenColor;
    } else if (type == 'Poison') {
      return kPurpleColor;
    } else if (type == 'Fire') {
      return kGreenColor;
    }
    return kWhiteColor;
  }
}
