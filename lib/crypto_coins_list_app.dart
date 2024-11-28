



import 'package:crypto_value/router/router.dart';
import 'package:crypto_value/theme/theme.dart';
import 'package:flutter/material.dart';

class CryptoCurrenciesListApp extends StatelessWidget {
    const CryptoCurrenciesListApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Crypto value',
        theme: theme,
        routes: routes,
      );
    }
  }