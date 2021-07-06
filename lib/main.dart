// @dart=2.9
import 'package:edcapp/AboutUs.dart';
import 'package:edcapp/Constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:edcapp/app/landing_page.dart';
import 'package:edcapp/app/sign_in/sign_in_page.dart';
import 'package:edcapp/services/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Edc',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LandingPage(
        auth: Auth(),
      ),
      routes: <String, WidgetBuilder>{
        ABOUTUS: (BuildContext context) => new AboutUs(),
        // ANIMATED_SPLASH: (BuildContext context) => new SplashScreen(),
        // PHOTO_CONTAINER_SCREEN: (BuildContext context) =>
        //     new PhotoContainerScreen(),
        // VIDEO_CONTAINER_SCREEN: (BuildContext context) =>
        //     new VideoContainerScreen(),
        // ALBUM_CONTAINER_SCREEN: (BuildContext context) =>
        //     new AlbumContainerScreen(),
        // DEFAULT_CONTAINER_SCREEN: (BuildContext context) =>
        //     new DefaultContainerScreen()
      },
    );
  }
}
