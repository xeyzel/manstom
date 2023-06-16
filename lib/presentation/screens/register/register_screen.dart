import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/core/util/utils.dart';
import 'package:inventory_app/presentation/screens/register/cubit/register_cubit.dart';
import 'package:inventory_app/presentation/widgets/center_loading.dart';

import 'cubit/register_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isVisible = true;

  void initial() {
    context.read<RegisterCubit>().reset();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Please join for use the app',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 24),
              StreamBuilder<String>(
                stream: context.read<RegisterCubit>().name,
                builder: (context, snapshot) {
                  return TextField(
                    onChanged: context.read<RegisterCubit>().setName,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      errorText: snapshot.error as dynamic,
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              StreamBuilder<String>(
                stream: context.read<RegisterCubit>().email,
                builder: (context, snapshot) {
                  return TextField(
                    onChanged: context.read<RegisterCubit>().setEmail,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      errorText: snapshot.error as dynamic,
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              StreamBuilder<String>(
                stream: context.read<RegisterCubit>().password,
                builder: (context, snapshot) {
                  return TextField(
                    onChanged: context.read<RegisterCubit>().setPassword,
                    obscureText: _isVisible,
                    decoration: InputDecoration(
                      errorText: snapshot.error as dynamic,
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
                  );
                },
              ),
              const SizedBox(height: 24),
              StreamBuilder<bool>(
                stream: context.read<RegisterCubit>().valid,
                builder: (context, snapshot) {
                  final valid = snapshot.data ?? false;
                  return BlocConsumer<RegisterCubit, RegisterState>(
                    listenWhen: (previous, current) {
                      return previous.status != current.status;
                    },
                    buildWhen: (previous, current) {
                      return previous.status != current.status;
                    },
                    listener: (context, state) {
                      if (state.status == Status.success) {
                        Navigator.pop(context);
                        Utils.showToast(state.message, color: Colors.green);
                      }

                      if (state.status == Status.failure) {
                        Utils.showToast(state.message, color: Colors.red);
                      }
                    },
                    builder: (context, state) {
                      Widget widget = ElevatedButton(
                        onPressed: valid
                            ? context.read<RegisterCubit>().register
                            : null,
                        child: const Text('Sign Up'),
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
                    const TextSpan(text: "Already have an account? "),
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
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
