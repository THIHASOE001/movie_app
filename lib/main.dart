import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/ui/widgets/button_nav.dart';
import 'package:movie_app/utils/consts/api_const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(ApiConst.SETTING_BOX);
  await Hive.openBox(ApiConst.API_BOX);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const ButtonNavigation(),
    );
  }
}
