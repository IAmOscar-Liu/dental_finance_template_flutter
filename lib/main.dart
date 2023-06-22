import 'package:flutter/material.dart';
import 'package:namer_app/components/custom_page.dart';
import 'package:namer_app/my_app_state.dart';
import 'package:namer_app/page/favorite_page.dart';
import 'package:namer_app/page/finance_page.dart';
import 'package:namer_app/page/home_page.dart';
import 'package:namer_app/page/management_page.dart';
import 'package:namer_app/page/order_page.dart';
import 'package:provider/provider.dart';

// flutter run -d chrome --web-renderer html

final Map<String, Widget> myRoutes = {
  "/": CustomPage(page: HomePage()),
  '/favorites': CustomPage(page: FavoritePage()),
  '/finance': CustomPage(page: FinancePage()),
  "/management": CustomPage(page: ManagementPage()),
  '/management/new': CustomPage(page: OrderPage()),
};

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        onGenerateRoute: (settings) => PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
                myRoutes[settings.name] ?? Placeholder(),
            settings: settings,
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero),
      ),
    );
  }
}
