import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/route_name.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/core/util/utils.dart';
import 'package:inventory_app/presentation/screens/login/cubit/login_cubit.dart';
import 'package:inventory_app/presentation/widgets/center_loading.dart';
import 'cubit/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isVisible = true;

  void _initial() {
    context.read<LoginCubit>().reset();
  }

  @override
  void initState() {
    _initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Hi, welcome back !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 24),
              StreamBuilder<String>(
                stream: context.read<LoginCubit>().email,
                builder: (context, snapshot) {
                  return TextField(
                    onChanged: context.read<LoginCubit>().setEmail,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      errorText: snapshot.error as dynamic,
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: _isVisible,
                onChanged: context.read<LoginCubit>().setPassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () => setState(
                      () => _isVisible = !_isVisible,
                    ),
                    icon: Icon(
                      _isVisible
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              StreamBuilder(
                stream: context.read<LoginCubit>().valid,
                builder: (context, snapshot) {
                  final valid = snapshot.data ?? false;

                  return BlocConsumer<LoginCubit, LoginState>(
                    listenWhen: (previous, current) {
                      return previous.status != current.status;
                    },
                    buildWhen: (previous, current) {
                      return previous.status != current.status;
                    },
                    listener: (context, state) {
                      if (state.status == Status.success) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteName.home,
                          (route) => false,
                        );
                        Utils.showToast(state.message, color: Colors.green);
                      }

                      if (state.status == Status.failure) {
                        Utils.showToast(state.message, color: Colors.red);
                      }
                    },
                    builder: (context, state) {
                      Widget widget = ElevatedButton(
                        onPressed:
                            valid ? context.read<LoginCubit>().login : null,
                        child: const Text('Sign In'),
                      );

                      if (state.status == Status.loading) {
                        widget = const CenterLoading();
                      }

                      return widget;
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: "Don't have an account yet? "),
                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(
                            context,
                            RouteName.register,
                          );
                        },
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
