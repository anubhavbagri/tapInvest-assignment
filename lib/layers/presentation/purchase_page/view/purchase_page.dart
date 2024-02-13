import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:slide_action/slide_action.dart';
import 'package:tap_invest/layers/presentation/theme.dart';
import 'package:tap_invest/layers/presentation/utils/size_config.dart';

class PurchasePage extends StatelessWidget {
  const PurchasePage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      // fullscreenDialog: true,
      builder: (context) {
        /// can initialize page level bloc/cubit here with parameter value
        return const PurchasePage();
      },
    );
  }

  @override
  Widget build(BuildContext context) => PurchaseView();
}

class PurchaseView extends StatelessWidget {
  PurchaseView({Key? key}) : super(key: key);

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: SizeConfig.safeVertical! * 0.1,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_rounded,
            color: CustomTheme.green700,
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              CustomTheme.green700.withOpacity(0.12),
            ),
          ),
          visualDensity: const VisualDensity(vertical: 3, horizontal: 3),
          padding: EdgeInsets.zero,
        ),
        leadingWidth: SizeConfig.safeHorizontal! * .3,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: CustomTheme.paddingRight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Purchasing',
                      style: CustomTheme.h6(context, color: Colors.black),
                    ),
                    vSizedBoxHalf,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Agrizy',
                            style: CustomTheme.s1(context,
                                color: CustomTheme.stone500,
                                weight: FontWeight.w400)),
                        hSizedBox1,
                        Icon(
                          Icons.arrow_back_rounded,
                          color: CustomTheme.stone500,
                          size: 15,
                        ),
                        hSizedBox1,
                        Text('Keshav Industries',
                            style: CustomTheme.s1(context,
                                color: CustomTheme.stone500,
                                weight: FontWeight.w400)),
                      ],
                    ),
                  ],
                ),
              ),
              vSizedBox4,
              Divider(color: CustomTheme.stone300, thickness: 1),
              vSizedBox4,
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'ENTER AMOUNT',
                    style: CustomTheme.s1(
                      context,
                      color: Colors.black.withOpacity(0.4),
                      letterSpacing: 1,
                    ),
                  ),
                  vSizedBox1,
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeHorizontal! * .3),
                    child: Row(
                      children: [
                        Text(
                          '₹ ',
                          style: CustomTheme.h6(
                            context,
                            color: CustomTheme.stone400,
                            weight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            autofocus: true,
                            controller: _textController,
                            decoration: InputDecoration.collapsed(
                              hintText: ' Min 50,000',
                              hintStyle: CustomTheme.h6(
                                context,
                                color: CustomTheme.stone400,
                              ),
                            ),
                            style: CustomTheme.h6(
                              context,
                              color: Colors.black,
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                              TextInputFormatter.withFunction(
                                  (oldValue, newValue) {
                                if (newValue.text.isEmpty) {
                                  return newValue;
                                }
                                try {
                                  final number = int.parse(newValue.text);
                                  final formattedValue = NumberFormat.currency(
                                          locale: 'en_IN', symbol: '')
                                      .format(number);
                                  _textController.value = TextEditingValue(
                                    text: formattedValue.substring(
                                        0, formattedValue.length - 3),
                                    // remove the currency symbol
                                    selection: TextSelection.collapsed(
                                        offset: formattedValue.length - 3),
                                  );
                                } catch (e) {
                                  print(e);
                                }
                                return _textController.value;
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.safeVertical! * .06,
              ),
              infoRow(context,
                  category: 'Total Returns',
                  value: '56,555',
                  unit: '₹ ',
                  isRupee: true),
              Divider(color: CustomTheme.stone300, thickness: 1),
              infoRow(context,
                  category: 'Net Yield', value: '13.11 ', unit: '%'),
              Divider(color: CustomTheme.stone300, thickness: 1),
              infoRow(context, category: 'Tenure', value: '61 ', unit: 'days'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Material(
          elevation: 10,
          color: Colors.white,
          surfaceTintColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: CustomTheme.paddingRight,
              vertical: CustomTheme.paddingVertical,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Balance: ₹1,00,000',
                      style: CustomTheme.s2(
                        context,
                        weight: FontWeight.w400,
                        color: CustomTheme.stone700,
                      ),
                    ),
                    Text(
                      'Required: ₹0',
                      style: CustomTheme.s2(
                        context,
                        weight: FontWeight.w400,
                        color: CustomTheme.stone700,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                vSizedBox2,
                SlideAction(
                  stretchThumb: true,
                  trackBuilder: (buildContext, currentState) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: CustomTheme.stone200,
                      ),
                      child: Center(
                        child: Text(
                          "SWIPE TO PAY",
                          style: CustomTheme.s1(
                            context,
                            color: CustomTheme.stone900,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    );
                  },
                  thumbBuilder: (context, currentState) {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: CustomTheme.green700,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 64,
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  action: () {
                    if(_textController.text.isEmpty) {

                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget infoRow(
    BuildContext context, {
    bool isRupee = false,
    required String category,
    required String value,
    required String unit,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: CustomTheme.paddingRight,
            vertical: CustomTheme.paddingVertical),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              category,
              style: CustomTheme.s1(
                context,
                color: CustomTheme.slate600,
                weight: FontWeight.w400,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  if (isRupee)
                    TextSpan(
                      text: unit,
                      style: CustomTheme.s1(
                        context,
                        weight: FontWeight.w500,
                        color: CustomTheme.stone400,
                      ),
                    ),
                  TextSpan(
                    text: value,
                    style: CustomTheme.s1(
                      context,
                      color: CustomTheme.slate600,
                      weight: FontWeight.w500,
                    ),
                  ),
                  if (!isRupee)
                    TextSpan(
                      text: unit,
                      style: CustomTheme.s1(
                        context,
                        weight: FontWeight.w500,
                        color: CustomTheme.stone400,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
}

/// static Route<void> route() {
/// return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) {
//         /// can initialize page level cubit here with parameter value
//         return const PurchasePage();
//       },
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         const begin = Offset(0.0, 1.0);
//         const end = Offset.zero;
//         final tween = Tween(begin: begin, end: end);
//         final offsetAnimation = animation.drive(tween);
//         return SlideTransition(
//           position: offsetAnimation,
//           child: child,
//         );
//       },
//     );
// }
