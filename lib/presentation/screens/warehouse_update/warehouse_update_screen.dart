import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/core/util/utils.dart';
import 'package:inventory_app/data/model/warehouse/warehouse.dart';
import 'package:inventory_app/presentation/screens/create_warehouse/cubit/create_warehouse_cubit.dart';
import 'package:inventory_app/presentation/screens/create_warehouse/cubit/create_warehouse_state.dart';
import 'package:inventory_app/presentation/widgets/center_loading.dart';
import 'package:inventory_app/presentation/widgets/custom_app_bar.dart';

class WarehouseUpdateScreen extends StatefulWidget {
  final Warehouse warehouse;

  const WarehouseUpdateScreen({
    super.key,
    required this.warehouse,
  });

  @override
  State<WarehouseUpdateScreen> createState() => _WarehouseUpdateScreenState();
}

class _WarehouseUpdateScreenState extends State<WarehouseUpdateScreen> {
  final _name = TextEditingController();
  final _address = TextEditingController();

  _initial() {
    _name.text = widget.warehouse.name;
    _address.text = widget.warehouse.address;
  }

  @override
  void initState() {
    _initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Utils.capital(widget.warehouse.name)),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Edit Warehouse Data',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 26),
            TextField(
              controller: _name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'name',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _address,
              decoration: const InputDecoration(label: Text('Address')),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: BlocConsumer<CreateWarehouseCubit, CreateWarehouseState>(
                listenWhen: (previous, current) {
                  return previous.status != current.status;
                },
                listener: (context, state) {
                  if (state.status == Status.success) {
                    context.read<CreateWarehouseCubit>().findAllWarehouse();
                  }
                },
                builder: (context, state) {
                  if (state.status == Status.loading) {
                    return const CenterLoading();
                  }

                  return ElevatedButton(
                    onPressed: () {
                      final warehouse = widget.warehouse.copyWith(
                        name: _name.text,
                        address: _address.text,
                      );

                      context
                          .read<CreateWarehouseCubit>()
                          .updateWarehoue(warehouse);
                      Navigator.pop(context);
                    },
                    child: const Text('Update'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
