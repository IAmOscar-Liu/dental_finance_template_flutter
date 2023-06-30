import 'package:flutter/material.dart';
import 'package:namer_app/components/custom/custom_page.dart';
import 'package:namer_app/my_app_state.dart';
import 'package:namer_app/page/dental_management_page.dart';
import 'package:namer_app/page/favorite_page.dart';
import 'package:namer_app/page/finance_page.dart';
import 'package:namer_app/page/home_page.dart';
import 'package:namer_app/page/contract_management_page.dart';
import 'package:namer_app/page/not_found_page.dart';
import 'package:namer_app/page/create_contract_page.dart';
import 'package:namer_app/page/create_dental_page.dart';
import 'package:provider/provider.dart';

// flutter run -d chrome --web-renderer html

void main() async {
  runApp(const MyApp());
}

final Map<String, Widget> myRoutes = {
  "/": HomePage(),
  '/favorites': FavoritePage(),
  '/finance': FinancePage(),
  '/dental-management': DentalManagementPage(),
  '/dental-management/new': CreateDentalPage(),
  "/contract-management": ContractManagementPage(),
  '/contract-management/new': CreateContractPage(),
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget getPage(String? pathname) {
    return CustomPage(page: myRoutes[pathname] ?? NotFoundPage());
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: '牙技財務暨設備管理平台',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        onGenerateRoute: (settings) => PageRouteBuilder(
            pageBuilder: (_, __, ___) => getPage(settings.name),
            settings: settings,
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero),
      ),
    );
  }
}
