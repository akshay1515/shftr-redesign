import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shifter/features/shifter/presentation/provider/bottomnavigationprovider/screen_provider.dart';
import 'package:shifter/features/shifter/presentation/provider/businessprovider/businessprovider.dart';
import 'package:shifter/features/shifter/presentation/provider/jobcategoryprovider/jobcategoryprovider.dart';
import 'package:shifter/features/shifter/presentation/provider/loginprovider/login_activity_provider.dart';
import 'package:shifter/features/shifter/presentation/provider/selectionprovider/selection_activity_provider.dart';
import 'package:shifter/features/shifter/presentation/provider/userskillprovider/userskillprovider.dart';
import 'package:shifter/features/shifter/presentation/provider/userswipecardprovider.dart';
import 'package:shifter/utils/routes.dart';
import '../features/shifter/presentation/pages/splashactivity/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      
      providers: [
        ChangeNotifierProvider.value(value: ScreenProvider()),
        ChangeNotifierProvider.value(value: SelectionProvider()),
        ChangeNotifierProvider.value(value: LoginProvider()),
        ChangeNotifierProvider.value(value: BusinessProvider()),
        ChangeNotifierProvider.value(value: CategoryProvider()),
        ChangeNotifierProvider.value(value: UserSkillProvider()),
        ChangeNotifierProvider.value(value: UserSwipeCardProvider()),
      ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}


