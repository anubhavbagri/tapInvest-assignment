import 'package:flutter/material.dart';
import 'package:tap_invest/layers/presentation/theme.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    const theme = CustomTheme();
    // SizeConfig().init(context);

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
            appBar: AppBar(
                title: Text(
              'data',
              style: TextStyle(fontSize: 50, color: CustomTheme.primaryColor),
            )),
            body: Container(),
          );
        },
      ),
    );
  }
}
