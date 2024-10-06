// import 'package:api204/post_api/post_api_ui/post_api_ui1.dart';
import 'package:api204/upload_image_api/upload_image_api_ui.dart';
import 'package:flutter/material.dart';
import 'manual_api/manual_api_ui/manual_api_ui1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Colors.deepPurple,
        ),
        textTheme:  const TextTheme(bodyMedium: TextStyle(color: Colors.white,fontSize: 18,fontWeight:FontWeight.normal )),
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).secondaryHeaderColor.withGreen(1),
          centerTitle: true,
          titleTextStyle:const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold)
        ),
        useMaterial3: true,
      ),
      // home: const ManualApiUi1(),
      // home:  const CoinDeskApiUi(),
      // home: const PostApiUi1(),
      // home: const PlaceholderApiUiEx1(),
      // home: const PlaceholderManualApiUiEx2(),
      home:const UploadImageApiUi(),

    );
  }
}
