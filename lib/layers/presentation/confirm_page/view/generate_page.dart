import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tap_invest/layers/presentation/constants/app_asset_paths.dart';
import 'package:tap_invest/layers/presentation/constants/app_strings.dart';
import 'package:tap_invest/layers/presentation/theme.dart';
import 'package:tap_invest/layers/presentation/utils/hex_color.dart';
import 'package:tap_invest/layers/presentation/utils/size_config.dart';

class GeneratePage extends StatelessWidget {
  const GeneratePage({Key? key}) : super(key: key);

  static Route<void> route() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const GeneratePage(),
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    );
  }

  @override
  Widget build(BuildContext context) => const GenerateView();
}

class GenerateView extends StatefulWidget {
  const GenerateView({Key? key}) : super(key: key);

  @override
  State<GenerateView> createState() => _GenerateViewState();
}

class _GenerateViewState extends State<GenerateView>
    with TickerProviderStateMixin {
  bool _isIconVisible = false;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isIconVisible = true;
      });
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    Future.delayed(const Duration(seconds: 2), () => _playAnimationTwice());
  }

  void _playAnimationTwice() {
    _animationController?.forward();
    _animationController!.addStatusListener(_animationStatusListener);
  }

  void _animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _animationController?.forward(from: 0.0);
    } else if (status == AnimationStatus.dismissed) {
      _animationController?.removeStatusListener(_animationStatusListener);
    }
  }

  @override
  void dispose() {
    _animationController
        ?.dispose(); // Dispose the AnimationController to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: CustomTheme.green700,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              AppAssetPath.vectorBg,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Lottie.asset(
              AppAssetPath.dotLottie,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
              controller: _animationController,
            ),
            Column(
              children: [
                SizedBox(
                  height: SizeConfig.safeVertical! * .2,
                ),
                Center(
                  child: Container(
                    height: SizeConfig.safeVertical! * .12,
                    width: SizeConfig.safeVertical! * .12,
                    decoration: BoxDecoration(
                      color: HexColor("#116631"),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: AnimatedOpacity(
                      opacity: _isIconVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                      child: const Icon(
                        Icons.my_library_books_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                vSizedBox5,
                AnimatedOpacity(
                  opacity: _isIconVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Generating Contract',
                        textAlign: TextAlign.center,
                        style: CustomTheme.h6(context, color: Colors.white),
                      ),
                      vSizedBox3,
                      Text(
                        AppStrings.confirmDesc,
                        textAlign: TextAlign.center,
                        style: CustomTheme.s2(
                          context,
                          color: Colors.white,
                          weight: FontWeight.w400,
                          isOverflow: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
