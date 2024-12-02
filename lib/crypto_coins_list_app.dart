
import 'package:crypto_value/router/router.dart';
import 'package:crypto_value/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoCurrenciesListApp extends StatelessWidget {
    const CryptoCurrenciesListApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Crypto value',
        theme: theme,
        routes: routes,
        navigatorObservers: [
          TalkerRouteObserver(GetIt.I<Talker>())
        ],
      );
    }
  }