import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/route_name.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/core/constant/string_resource.dart';
import 'package:inventory_app/core/util/utils.dart';
import 'package:inventory_app/presentation/screens/profile/cubit/profile_cubit.dart';
import 'package:inventory_app/presentation/screens/profile/cubit/profile_state.dart';
import 'package:inventory_app/presentation/widgets/custom_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _initial() {
    context.read<ProfileCubit>().started();
  }

  @override
  void initState() {
    _initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: StringResource.profile,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.amber[50],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          )),
                      child: Text('Name : ${state.user.name}'),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.amber[50],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          )),
                      child: Text('Email : ${state.user.email}'),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
            BlocListener<ProfileCubit, ProfileState>(
              listenWhen: (previous, current) {
                return previous.status != current.status;
              },
              listener: (context, state) {
                if (state.status == Status.success && state.loggedOut) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteName.login,
                    (route) => false,
                  );
                  Utils.showToast(
                    'Logged Out Successful',
                    color: Colors.green,
                  );
                }
              },
              child: ElevatedButton(
                onPressed: context.read<ProfileCubit>().logout,
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
