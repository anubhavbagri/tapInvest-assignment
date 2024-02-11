import 'package:flutter/material.dart';
import 'package:tap_invest/layers/presentation/constants/app_strings.dart';
import 'package:tap_invest/layers/presentation/theme.dart';
import 'package:tap_invest/layers/presentation/utils/size_config.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    const theme = CustomTheme();
    SizeConfig().init(context);

    return MaterialApp(
      theme: theme.base(),
      debugShowCheckedModeBanner: false,
      title: 'tapInvest',
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: CustomTheme.green700,
                ),
                padding: EdgeInsets.only(
                  left: CustomTheme.paddingHorizontal,
                ),
              ),
              toolbarHeight: SizeConfig.safeVertical! * 0.1,
              // backgroundColor: Colors.black26,
              // leadingWidth: SizeConfig.safeHorizontal! * 0.2,
              title: Text(
                AppStrings.appbarText,
                style: CustomTheme.h6(context),
              ),
              centerTitle: false,
              automaticallyImplyLeading: false,
              titleSpacing: 0,
            ),
            body: Center(child: Container()),
            bottomNavigationBar: Container(
              color: Colors.black54,
              height: 30,
            ),
          );
        },
      ),
    );
  }
}
