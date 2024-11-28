import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto value',
      theme: ThemeData(
        listTileTheme: const ListTileThemeData(
            iconColor: Colors.blue),
        dividerColor: Colors.lightBlueAccent,
        textTheme: const TextTheme(
          labelSmall: TextStyle(
            fontSize: 15,
          ),
          bodyMedium: TextStyle(
            fontSize: 20,
          ),

        ),
        scaffoldBackgroundColor: Colors.white,
        colorSchemeSeed: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          centerTitle: true,
        )
      ),
      home: const CryptoListScreen(),
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.deepOrange,
        title: const Text('Crypto value'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) =>
        const Divider(
          color: Colors.blue,
          height: 10,
        ),
        itemCount: 10,
        itemBuilder: (context, i) =>
            ListTile(
              title: Text(
                'coin',
                style: theme.textTheme.bodyMedium,),
              subtitle: Text(
                'data',
                style: theme.textTheme.labelSmall,),
              trailing: const Icon (Icons.arrow_forward_ios,),
            ),),
    );
  }
}

  class CryptoCoinScreen extends StatelessWidget {
    const CryptoCoinScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('data'),),
      );
    }
  }




  
