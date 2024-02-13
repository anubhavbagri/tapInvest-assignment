import 'package:flutter/material.dart';
import 'package:tap_invest/layers/presentation/constants/app_asset_paths.dart';
import 'package:tap_invest/layers/presentation/constants/app_strings.dart';
import 'package:tap_invest/layers/presentation/purchase_page/view/purchase_page.dart';
import 'package:tap_invest/layers/presentation/theme.dart';
import 'package:tap_invest/layers/presentation/utils/size_config.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    const theme = CustomTheme();

    return MaterialApp(
      theme: theme.base(),
      debugShowCheckedModeBanner: false,
      title: 'tapInvest',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    List chipList = [
      buildChip(context, 'funding'),
      buildChip(context, 'traction'),
      buildChip(context, 'financials', true),
      buildChip(context, 'competition'),
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: SizeConfig.safeVertical! * 0.1,
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
        title: Text(
          AppStrings.appbarText,
          style: CustomTheme.s1(context),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: CustomTheme.paddingRight),
                child: Image.asset(
                  AppAssetPath.logo2,
                  fit: BoxFit.cover,
                  width: SizeConfig.safeHorizontal! * 0.3,
                ),
              ),
              vSizedBox2,
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: CustomTheme.paddingRight),
                child: Row(
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
              ),
              vSizedBox1,
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: CustomTheme.paddingRight),
                child: Text(
                  AppStrings.agrizyDesc,
                  style: CustomTheme.s1(
                    context,
                    color: CustomTheme.stone500,
                    weight: FontWeight.w500,
                  ),
                  maxLines: 2,
                ),
              ),
              vSizedBox3,
              statTable(context),
              vSizedBox4,
              Divider(color: CustomTheme.stone300, thickness: 1),
              vSizedBox4,
              midSection(context, title: 'Clients'),
              vSizedBox4,
              midSection(context, title: 'Backed by'),
              vSizedBox4,
              Divider(color: CustomTheme.stone300, thickness: 1),
              vSizedBox4,
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: CustomTheme.paddingRight,
                    ),
                    child: heading(context, 'Highlights'),
                  ),
                  vSizedBox4,
                  cardCarousel(context),
                ],
              ),
              vSizedBox4,
              Divider(color: CustomTheme.stone300, thickness: 1),
              vSizedBox4,
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: CustomTheme.paddingRight,
                    ),
                    child: heading(context, 'Key Metrics'),
                  ),
                  SizedBox(
                    height: SizeConfig.safeVertical! * 0.08,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      primary: false,
                      padding: EdgeInsets.symmetric(
                          horizontal: CustomTheme.paddingRight),
                      separatorBuilder: (_, index) =>
                          SizedBox(width: CustomTheme.textPadding),
                      itemCount: chipList.length,
                      itemBuilder: (_, index) => chipList[index],
                    ),
                  ),
                  vSizedBox1,
                  statTable(context),
                  vSizedBox4,
                  Divider(color: CustomTheme.stone300, thickness: 1),
                  vSizedBox4,
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: CustomTheme.paddingRight,
                    ),
                    child: heading(context, 'Documents'),
                  ),
                  vSizedBox4,
                  swipeCard(
                    context,
                    child: docContent(context),
                  ),
                  vSizedBox3,
                  swipeCard(
                    context,
                    child: docContent(context),
                  ),
                  vSizedBox6,
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 10,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: SizedBox(
          height: SizeConfig.safeVertical! * .1,
          child: ListTile(
            contentPadding: EdgeInsets.fromLTRB(
                SizeConfig.safeHorizontal! * .06,
                SizeConfig.safeVertical! * .01,
                SizeConfig.safeHorizontal! * .06,
                0),
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FILLED',
                      style: CustomTheme.s2(context,
                          color: Colors.black.withOpacity(0.4)),
                    ),
                    Text(
                      '30%',
                      style: CustomTheme.s1(
                        context,
                        weight: FontWeight.w500,
                        color: CustomTheme.gray700,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    ///can pass any value from here to the next page through its route
                    Navigator.of(context).push(PurchasePage.route());
                  },
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
                    children: [
                      Text(
                        AppStrings.tapToInvest,
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
        ),
      ),
    );
  }

  Widget docContent(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vSizedBox1,
          Icon(
            Icons.lightbulb,
            color: CustomTheme.stone500,
            size: 30,
          ),
          vSizedBox4,
          ListTile(
            title: Text(
              'Invoice Discounting Contract',
              style: CustomTheme.s1(
                context,
                color: CustomTheme.stone700,
                weight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              'All the legalese surrounding this deal and how it relates to you.',
              style: CustomTheme.s1(context,
                  color: CustomTheme.stone500,
                  weight: FontWeight.w400,
                  isOverflow: false),
            ),
            trailing: Icon(
              Icons.arrow_circle_down,
              color: CustomTheme.stone500,
              size: 30,
            ),
            minVerticalPadding: 0,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            contentPadding: const EdgeInsets.symmetric(horizontal: 4),
          ),
          vSizedBox2,
        ],
      );

  Widget buildChip(BuildContext context, String txt,
          [bool isSelected = false]) =>
      Chip(
        label: Text(
          txt.toUpperCase(),
          style: CustomTheme.bs(
            context,
            weight: FontWeight.w600,
            color: isSelected ? Colors.white : CustomTheme.stone500,
          ),
        ),
        backgroundColor:
            isSelected ? CustomTheme.green700 : CustomTheme.stone200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        visualDensity: VisualDensity.compact,
        padding: EdgeInsets.zero,
        side: const BorderSide(
          width: 0,
          color: Colors.transparent,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
        labelPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.safeHorizontal! * .03,
        ),
      );

  Widget statTable(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(
          horizontal: CustomTheme.paddingRight,
        ),
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
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(children: [
              tableCell(context,
                  isInvestment: true,
                  category: 'min invt',
                  value: '1',
                  unit: 'Lakh'),
              tableCell(
                context,
                category: 'tenure',
                value: '61',
                unit: 'days',
              ),
            ]),
            TableRow(children: [
              tableCell(
                context,
                category: 'net yield',
                value: '13.23',
                unit: '%',
              ),
              tableCell(
                context,
                category: 'raised',
                value: '70',
                unit: '%',
              ),
            ]),
          ],
        ),
      );

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

  Widget midSection(
    BuildContext context, {
    required String title,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: CustomTheme.paddingRight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heading(context, title),
            vSizedBox2,
            Row(
              children: [
                Image.asset(
                  AppAssetPath.google,
                  fit: BoxFit.cover,
                  width: SizeConfig.safeHorizontal! * 0.2,
                ),
                hSizedBox2,
                Image.asset(
                  AppAssetPath.google,
                  fit: BoxFit.cover,
                  width: SizeConfig.safeHorizontal! * 0.2,
                ),
                hSizedBox2,
                Image.asset(
                  AppAssetPath.google,
                  fit: BoxFit.cover,
                  width: SizeConfig.safeHorizontal! * 0.2,
                ),
              ],
            ),
          ],
        ),
      );

  Widget cardCarousel(BuildContext context) {
    return SizedBox(
      height: SizeConfig.safeVertical! * 0.2,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.85),
        padEnds: false,
        itemCount: 3,
        itemBuilder: (_, index) => swipeCard(
          context,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.lightbulb,
                color: CustomTheme.stone500,
                size: 30,
              ),
              Text(
                AppStrings.highlightDesc,
                style: CustomTheme.s2(
                  context,
                  color: CustomTheme.stone500,
                  weight: FontWeight.w400,
                  isOverflow: false,
                ),
              ),
            ],
          ),
          index: index,
        ),
      ),
    );
  }

  Widget swipeCard(
    BuildContext context, {
    required Widget child,
    int index = 2,
  }) =>
      Card(
        margin: EdgeInsets.only(
          left: CustomTheme.paddingRight,
          right: index == 2
              ? CustomTheme.paddingRight
              : CustomTheme.paddingHorizontal,
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: CustomTheme.stone300,
            width: 1,
          ),
        ),
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(CustomTheme.paddingAllSides),
          child: child,
        ),
      );

  Widget heading(BuildContext context, String text) => Text(
        text,
        style: CustomTheme.h6(
          context,
          color: CustomTheme.stone700,
          weight: FontWeight.w500,
        ),
      );
}
