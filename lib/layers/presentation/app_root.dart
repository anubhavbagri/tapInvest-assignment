import 'package:flutter/material.dart';
import 'package:tap_invest/layers/presentation/constants/app_asset_paths.dart';
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
                style: CustomTheme.s1(context),
              ),
              centerTitle: false,
              automaticallyImplyLeading: false,
              titleSpacing: 0,
            ),

            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: CustomTheme.paddingRight),
              child: Column(
                children: [
                  Image.asset(
                    AppAssetPath.logo2,
                    fit: BoxFit.cover,
                    width: SizeConfig.safeHorizontal! * 0.3,
                  ),
                ],
              ),
            ),
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
