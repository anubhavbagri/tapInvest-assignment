import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:slide_action/slide_action.dart';
import 'package:tap_invest/layers/presentation/confirm_page/view/confirm_page.dart';
import 'package:tap_invest/layers/presentation/constants/app_strings.dart';
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
  Widget build(BuildContext context) => const PurchaseView();
}

class PurchaseView extends StatefulWidget {
  const PurchaseView({Key? key}) : super(key: key);

  @override
  State<PurchaseView> createState() => _PurchaseViewState();
}

class _PurchaseViewState extends State<PurchaseView> {
  final TextEditingController _textController = TextEditingController();
  ValueNotifier<String> returnAmount = ValueNotifier<String>('56,555');
  final FocusNode _focusNode = FocusNode();
  bool showError = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        showError = false;
      });
    });
  }

  @override
  void dispose() {
    returnAmount.dispose();
    super.dispose();
  }

  void handleSubmit() {
    setState(() {
      if (_textController.text.isEmpty) {
        showError = true;
      } else {
        showError = false;
        print("Submitted: ${_textController.text}");
      }
    });
    if (int.parse(_textController.text.replaceAll(',', '')) >= 50000) {
      Navigator.of(context).push(ConfirmPage.route());
    }
  }

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
                    padding: EdgeInsets.only(
                      left: SizeConfig.safeHorizontal! * .3,
                      right: SizeConfig.safeHorizontal! * .2,
                    ),
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
                            focusNode: _focusNode,
                            autofocus: true,
                            controller: _textController,
                            onChanged: (value) {
                              if (value == '') {
                                returnAmount.value = '56,555';
                              } else if (value == '1,00,000') {
                                returnAmount.value = '1,13,110';
                              } else {
                                returnAmount.value = '-';
                              }
                              setState(() {
                                showError = false;
                              });
                            },
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
                  ),
                  if (showError)
                    Padding(
                      padding:
                          EdgeInsets.only(top: CustomTheme.paddingVertical),
                      child: Text(
                        AppStrings.errorText,
                        style: CustomTheme.s2(
                          context,
                          weight: FontWeight.w400,
                          color: CustomTheme.amber700,
                        ),
                      ),
                    ),
                ],
              ),
              vSizedBox6,
              ValueListenableBuilder(
                valueListenable: returnAmount,
                builder: (context, value, child) {
                  return infoRow(
                    context,
                    category: 'Total Returns',
                    value: value,
                    unit: '₹ ',
                    isRupee: true,
                  );
                },
              ),
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
                  action: handleSubmit,
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
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: category,
                style: CustomTheme.s1(
                  context,
                  color: CustomTheme.slate600,
                  weight: FontWeight.w400,
                ),
              ),
              if (category.contains('Yield'))
                TextSpan(
                  text: '  IRR ⓘ',
                  style: CustomTheme.s2(
                    context,
                    color: CustomTheme.green700,
                    weight: FontWeight.w500,
                  ),
                ),
            ])),
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
