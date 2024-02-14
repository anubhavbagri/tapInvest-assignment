import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tap_invest/layers/presentation/constants/app_asset_paths.dart';
import 'package:tap_invest/layers/presentation/constants/app_strings.dart';
import 'package:tap_invest/layers/presentation/theme.dart';
import 'package:tap_invest/layers/presentation/utils/hex_color.dart';
import 'package:tap_invest/layers/presentation/utils/size_config.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const ConfirmPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => const ConfirmView();
}

class ConfirmView extends StatefulWidget {
  const ConfirmView({Key? key}) : super(key: key);

  @override
  State<ConfirmView> createState() => _ConfirmViewState();
}

class _ConfirmViewState extends State<ConfirmView>
    with TickerProviderStateMixin {
  bool _isVisible = false;
  bool _isIconVisible = false;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true;
        Future.delayed(const Duration(milliseconds: 1200), () {
          setState(() {
            _isIconVisible = true;
          });
        });
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
              // onLoaded: (composition) {
              //   setState(() {
              //     _animationController?.duration = composition.duration;
              //   });
              // },
              // repeat: true,
            ),
            Column(
              children: [
                SizedBox(
                  height: SizeConfig.safeVertical! * .2,
                ),
                Center(
                  child: AnimatedOpacity(
                    opacity: _isVisible ? 1.0 : 0.0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInExpo,
                    child: Container(
                      height: SizeConfig.safeVertical! * .12,
                      width: SizeConfig.safeVertical! * .12,
                      decoration: BoxDecoration(
                        color: HexColor("#116631"),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: AnimatedOpacity(
                        opacity: _isIconVisible ? 1.0 : 0.0,
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn,
                        child: const Icon(
                          Icons.check_circle_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                vSizedBox5,
                AnimatedOpacity(
                  opacity: _isIconVisible ? 1.0 : 0.0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.decelerate,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Payment done',
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
