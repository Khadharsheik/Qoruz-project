import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qoruz_app/core/app_theme.dart';
import 'package:qoruz_app/core/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Image? image;

  @override
  void initState() {
    super.initState();
    image = Image.asset(
      key: const Key('splash'),
      AppAssets.splashScreenBg,
      height: 50,
      width: 50,
      gaplessPlayback: true,
      filterQuality: FilterQuality.high,
      repeat: ImageRepeat.repeat,
    );
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacementNamed(AppRoutes.landing),
    );
  }

  @override
  void didChangeDependencies() {
    precacheImage(
      image!.image,
      context,
      onError: (exception, stackTrace) {
        log(
          'error precaching image $exception- path:$stackTrace',
        );
      },
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      body: Center(child: image),
    );
  }
}
