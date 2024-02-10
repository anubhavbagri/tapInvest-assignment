import 'package:flutter/material.dart';
import 'package:tap_invest/layers/presentation/theme.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    const theme = CustomTheme();

    return MaterialApp(
      theme: theme.base(),
      debugShowCheckedModeBanner: false,
      title: 'tapInvest',
      home: Builder(
        builder: (context) {
          // final tt = Theme.of(context).textTheme;
          // final cs = Theme.of(context).colorScheme;
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(),
            body: Container(),
          );
        },
      ),
    );
  }
}
