import 'package:flutter/material.dart';
import 'package:namer_app/components/app_bar_title.dart';
import 'package:namer_app/components/sidebar.dart';
import 'package:namer_app/my_app_state.dart';
import 'package:namer_app/page/favorite_page.dart';
import 'package:namer_app/page/finance_page.dart';
import 'package:namer_app/page/generate_page.dart';
import 'package:provider/provider.dart';

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
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 2;

  void onDestinationSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritePage();
        break;
      case 2:
        page = FinancePage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: false,
        toolbarHeight: 66,
        // shadowColor: Colors.black12,
        title: AppBarTitle(),
      ),
      body: Row(
        children: [
          Sidebar(
              onDestinationSelected: onDestinationSelected,
              selectedIndex: selectedIndex),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          ),
        ],
      ),
    );
  }
}
