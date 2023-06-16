import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/image_asset_path.dart';
import 'package:inventory_app/core/constant/route_name.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/core/constant/string_resource.dart';
import 'package:inventory_app/presentation/screens/splash/cubit/splash_cubit.dart';
import 'package:inventory_app/presentation/screens/splash/cubit/splash_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  void _initial() async {
    context.read<SplashCubit>().started();
  }

  @override
  void initState() {
    _initial();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocListener<SplashCubit, SplashState>(
            listenWhen: (previous, current) {
              return previous.status != current.status;
            },
            listener: (context, state) {
              _timer = Timer(const Duration(milliseconds: 3000), () {
                if (state.status == Status.success && state.userId != null) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteName.home,
                    (route) => false,
                  );
                } else {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteName.login,
                    (route) => false,
                  );
                }
              });
            },
            child: const SizedBox.shrink(),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      ImageAssetPath.appLogo,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    StringResource.appName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            StringResource.version,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
