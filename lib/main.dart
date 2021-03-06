import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/places.dart';
import '/screens/places_list_screen.dart';
import '/screens/add_place_screen.dart';
import '/screens/places_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Places>(
          create: (_) => Places(),
        ),
      ],
      child: MaterialApp(
        title: 'Great Places',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        // ThemeData(
        //   colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
        //       .copyWith(secondary: Colors.amber),
        // ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
          PlaceDetailScreen.routeName: (ctx) => PlaceDetailScreen(),
        },
      ),
    );
  }
}
