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
              padding:
                  EdgeInsets.symmetric(horizontal: CustomTheme.paddingRight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppAssetPath.logo2,
                    fit: BoxFit.cover,
                    width: SizeConfig.safeHorizontal! * 0.3,
                  ),
                  vSizedBox2,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Agrizy', style: CustomTheme.h6(context)),
                      hSizedBox1,
                      Icon(
                        Icons.arrow_back_rounded,
                        color: CustomTheme.textActive.withOpacity(0.4),
                        size: 25,
                      ),
                      hSizedBox1,
                      Text('Keshav Industries',
                          style: CustomTheme.h6(context,
                              color: CustomTheme.stone500)),
                    ],
                  ),
                  vSizedBox1,
                  Text(
                    AppStrings.agrizyDesc,
                    style: CustomTheme.s1(
                      context,
                      color: CustomTheme.stone500,
                      weight: FontWeight.w500,
                    ),
                    maxLines: 2,
                  ),
                  vSizedBox3,
                  Container(
                    // height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: CustomTheme.stone300,
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      ),
                      color: CustomTheme.stone300.withOpacity(0.2),
                    ),
                    child: Table(
                      border: TableBorder.symmetric(
                        inside: BorderSide(
                          width: 1,
                          color: CustomTheme.stone300,
                        ),
                      ),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(children: [
                          tableCell(context,
                              isInvestment: true,
                              category: 'min invt',
                              value: '1',
                              unit: 'Lakh'),
                          tableCell(context,
                              category: 'tenure', value: '61', unit: 'days'),
                        ]),
                        TableRow(children: [
                          tableCell(context,
                              category: 'net yield', value: '13.23', unit: '%'),
                          tableCell(context,
                              category: 'raised', value: '70', unit: '%'),
                        ]),
                      ],
                    ),
                  )
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

  Widget tableCell(
    BuildContext context, {
    bool isInvestment = false,
    required String category,
    required String value,
    required String unit,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: CustomTheme.paddingHorizontal,
            vertical: CustomTheme.paddingVertical),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.toUpperCase(),
              style: CustomTheme.s2(
                context,
              ),
            ),
            vSizedBox1,
            RichText(
              text: TextSpan(
                children: [
                  if (isInvestment)
                    TextSpan(
                      text: '₹ ',
                      style: CustomTheme.s1(
                        context,
                        weight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                  TextSpan(
                    text: '$value ',
                    style: CustomTheme.s1(
                      context,
                      weight: FontWeight.w500,
                      color: CustomTheme.stone700,
                    ),
                  ),
                  TextSpan(
                    text: unit,
                    style: CustomTheme.s1(
                      context,
                      weight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
