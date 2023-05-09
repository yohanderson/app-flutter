import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'UI/widgets/navbar/trips.dart';
import 'UI/widgets/styles/theme_app.dart';

void main() async {
    runApp( const AppFlutter());
}

class AppFlutter extends StatefulWidget{
  const AppFlutter({super.key});

  @override
  State<StatefulWidget> createState() => _AppFlutter();
}

class _AppFlutter  extends State<AppFlutter> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const AppFlutterTrips(),
    );
  }
}
