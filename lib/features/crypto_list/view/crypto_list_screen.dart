import 'package:crypto_value/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:flutter/material.dart';
import '../../../repositories/crypto_coins/models/crypto_coin.dart';
import '../widgets/crypto_coin_tile.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {

  @override
  void initState(){
    loadCryptoCoinsList();
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.deepOrange,
        title: const Text('Crypto value'),
      ),
      body:
      (_cryptoCoinsList == null) ? const Center(child: CircularProgressIndicator(),) :
      ListView.separated(
        padding: const EdgeInsets.only(top: 15),
        separatorBuilder: (context, index) =>
      const Divider(
        color: Colors.blue,
        height: 10,
      ),
        itemCount: _cryptoCoinsList!.length,
        itemBuilder: (context, i) {
          final coin = _cryptoCoinsList![i];
          return CryptoListTile(coin : coin);
        },),
    );
  }
  List<CryptoCoin>? _cryptoCoinsList;

  Future <void> loadCryptoCoinsList() async {
    _cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
    setState(() {});
  }
}


