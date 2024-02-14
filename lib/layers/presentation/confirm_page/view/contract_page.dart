import 'package:flutter/material.dart';
import 'package:tap_invest/layers/presentation/confirm_page/view/final_page.dart';
import 'package:tap_invest/layers/presentation/constants/app_asset_paths.dart';
import 'package:tap_invest/layers/presentation/constants/app_strings.dart';
import 'package:tap_invest/layers/presentation/theme.dart';
import 'package:tap_invest/layers/presentation/utils/size_config.dart';

class ContractPage extends StatelessWidget {
  const ContractPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) {
        return const ContractPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) => const ContractView();
}

class ContractView extends StatelessWidget {
  const ContractView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssetPath.contract,
              fit: BoxFit.cover,
            ),
            vSizedBox4,
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(FinalPage.route()),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(
                  CustomTheme.primaryColor,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: CustomTheme.green700,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.sign,
                    textAlign: TextAlign.center,
                    style: CustomTheme.s2(
                      context,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
