import 'package:collabverse/app.dart';
import 'package:collabverse/provider/bookmark/data_list_provider.dart';
import 'package:collabverse/screen/bookmark/bookmark_screen.dart';
import 'package:collabverse/static/navigation_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(const CollabVerseApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataListProvider()),
        // Provider(create: (context) => )
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return MaterialApp(
      initialRoute: NavigationRoute.mainRoute.name,
      routes: {
        NavigationRoute.mainRoute.name: (context) => const BookmarkScreen(),
        // NavigationRoute.detailRoute.name: (context) => DetailScreen()
      },
    );
  }
}
