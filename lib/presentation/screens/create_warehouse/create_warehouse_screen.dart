import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/route_name.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/core/util/utils.dart';
import 'package:inventory_app/presentation/screens/create_product/cubit/create_product_cubit.dart';
import 'package:inventory_app/presentation/screens/create_warehouse/cubit/create_warehouse_cubit.dart';
import 'package:inventory_app/presentation/screens/create_warehouse/cubit/create_warehouse_state.dart';
import 'package:inventory_app/presentation/screens/home/bloc/home_cubit.dart';
import 'package:inventory_app/presentation/widgets/center_loading.dart';

class CreateWarehouseScreen extends StatefulWidget {
  const CreateWarehouseScreen({Key? key}) : super(key: key);

  @override
  State<CreateWarehouseScreen> createState() => _CreateWarehouseScreenState();
}

class _CreateWarehouseScreenState extends State<CreateWarehouseScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Warehouse'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Warehouse',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              onChanged: context.read<CreateWarehouseCubit>().setName,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'name not allowed empty';
                }
                return null;
              },
              decoration: const InputDecoration(
                label: Text('Name'),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              onChanged: context.read<CreateWarehouseCubit>().setAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Address not allowed empty';
                }
                return null;
              },
              decoration: const InputDecoration(
                label: Text('Address'),
              ),
            ),
            const SizedBox(height: 16),
            BlocConsumer<CreateWarehouseCubit, CreateWarehouseState>(
              listenWhen: (previous, current) {
                return previous.status != current.status;
              },
              listener: (context, state) {
                // if (state.status == Status.success) {
                //   Navigator.pushNamedAndRemoveUntil(
                //     context,
                //     RouteName.home,
                //     (route) => false,
                //   );
                //   context.read<HomeCubit>().setIndex(1);

                // Utils.showToast(state.message, color: Colors.green);
                // }

                // if (state.status == Status.failure) {
                //
                // }
              },
              builder: (context, state) {
                Widget widget = ElevatedButton(
                  onPressed: () async {
                    final validate = _formKey.currentState?.validate();
                    if (!validate!) return;

                    final result = await context
                        .read<CreateWarehouseCubit>()
                        .insertWarehouse();
                    if (result) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteName.home,
                        (route) => false,
                      );
                      context.read<HomeCubit>().setIndex(1);

                      Utils.showToast(state.message, color: Colors.green);
                    } else {
                      Utils.showToast(state.message, color: Colors.red);
                    }
                  },
                  child: const Text('Save'),
                );

                if (state.status == Status.loading) {
                  return const CenterLoading();
                }

                return widget;
              },
            ),
          ],
        ),
      ),
    );
  }
}
