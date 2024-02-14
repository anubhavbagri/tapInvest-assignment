import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tap_invest/layers/presentation/constants/app_asset_paths.dart';
import 'package:tap_invest/layers/presentation/theme.dart';
import 'package:tap_invest/layers/presentation/utils/hex_color.dart';
import 'package:tap_invest/layers/presentation/utils/size_config.dart';

class FinalPage extends StatelessWidget {
  const FinalPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) {
        return const FinalPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) => const FinalView();
}

class FinalView extends StatefulWidget {
  const FinalView({Key? key}) : super(key: key);

  @override
  State<FinalView> createState() => _FinalViewState();
}

class _FinalViewState extends State<FinalView> with TickerProviderStateMixin {
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

    Future.delayed(const Duration(seconds: 2), () => _playAnimation());
  }

  void _playAnimation() {
    _animationController?.repeat();
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
                        Icons.outlined_flag,
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
                        'All Done!',
                        textAlign: TextAlign.center,
                        style: CustomTheme.h6(context, color: Colors.white),
                      ),
                      vSizedBox3,
                      Text(
                        'Redirecting you to the Dashboard',
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
