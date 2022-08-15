import 'package:conrev/Screen/Login.dart';
import 'package:conrev/Screen/MainScreen.dart';
import 'package:conrev/service/cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var login = await Cache().getLogin();
  runApp(MyApp(isLogin: login ?? false));
}

class MyApp extends StatelessWidget {
  final bool? isLogin;
  const MyApp({Key? key, this.isLogin}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            home: isLogin! ? MainScreen() : LoginScreen(),
          );
        },
      ),
    );
  }
}
