import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kosherparatodos/src/providers/connectivity.dart';
import 'package:kosherparatodos/style/theme.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final ConnectivityProvider connection = ConnectivityProvider.getInstance();
  connection.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: "Principal");

  MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      key: navigatorKey,
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //     textTheme: GoogleFonts.openSansTextTheme(textTheme),
      //     fontFamily: 'OpenSans'),
      theme: themeData(),
      home: App(),
    );
  }
}
