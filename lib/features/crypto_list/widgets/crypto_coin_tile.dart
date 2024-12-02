
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../repositories/crypto_coins/models/crypto_coin.dart';

class CryotoCoinTile extends StatelessWidget {
  const CryotoCoinTile({
    Key? key,
    required this.coin,
  }) : super(key: key);

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coinDetails = coin.details;
    return ListTile(
      leading: Image.network(coinDetails.fullImageUrl),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        '${coinDetails.priceInUSD} \$',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        AutoRouter.of(context).push(CryptoCoinRoute(coin: coin));
        // Navigator.of(context).pushNamed(
        //   '/coin',
        //   arguments: coin,
        // );
      },
    );
  }
}