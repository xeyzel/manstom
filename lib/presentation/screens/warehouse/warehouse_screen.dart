import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/route_name.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/core/constant/string_resource.dart';
import 'package:inventory_app/presentation/screens/create_product/cubit/create_product_cubit.dart';
import 'package:inventory_app/presentation/screens/create_product/cubit/create_product_state.dart';
import 'package:inventory_app/presentation/screens/create_warehouse/cubit/create_warehouse_cubit.dart';
import 'package:inventory_app/presentation/screens/create_warehouse/cubit/create_warehouse_state.dart';
import 'package:inventory_app/presentation/screens/warehouse_update/warehouse_update_screen.dart';
import 'package:inventory_app/presentation/widgets/center_loading.dart';
import 'package:inventory_app/presentation/widgets/custom_app_bar.dart';

class WarehouseScreen extends StatefulWidget {
  const WarehouseScreen({Key? key}) : super(key: key);

  @override
  State<WarehouseScreen> createState() => _WarehouseScreenState();
}

class _WarehouseScreenState extends State<WarehouseScreen> {
  void _intial() {
    context.read<CreateWarehouseCubit>().findAllWarehouse();
    context.read<CreateProductCubit>().findAllProduct();
  }

  @override
  void initState() {
    _intial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: StringResource.warehouse,
      ),
      body: BlocBuilder<CreateWarehouseCubit, CreateWarehouseState>(
        builder: (context, state) {
          final warehouses = state.warehouses;

          if (state.status == Status.loading) {
            return const CenterLoading();
          }

          if (warehouses.isEmpty) {
            return const Center(
              child: Text('No Warehouse'),
            );
          }

          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      context
                          .read<CreateProductCubit>()
                          .setSelectedWarehouseId(null);
                      Navigator.pushNamed(
                        context,
                        RouteName.listProduct,
                      );
                    },
                    child: const Text('See All Products'),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: const [
                    Text(
                      'List Warehouses',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text('Hold For See Warehouse Detail'),
                  ],
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final warehouse = state.warehouses.elementAt(index);
                  return ListTile(
                    onLongPress: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return WarehouseUpdateScreen(
                            warehouse: warehouse,
                          );
                        },
                      ));
                    },
                    onTap: () {
                      context
                          .read<CreateProductCubit>()
                          .setSelectedWarehouseId(warehouse.id);
                      Navigator.pushNamed(
                        context,
                        RouteName.listProduct,
                      );
                    },
                    leading: CircleAvatar(
                      child: Text(warehouse.name[0]),
                    ),
                    title: Text(warehouse.name),
                    subtitle: Text(warehouse.address),
                    trailing:
                        BlocBuilder<CreateProductCubit, CreateProductState>(
                      builder: (context, state) {
                        if (state.status == Status.loading) {
                          return const SizedBox();
                        }

                        final products = state.products.where(
                            (element) => element.warehouseId == warehouse.id);

                        if (products.isEmpty &&
                            state.status == Status.success) {
                          return IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Delete Warehouse ?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          context
                                              .read<CreateWarehouseCubit>()
                                              .deleteOneWarehouse(warehouse.id);
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Yes'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('No'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.delete),
                          );
                        }

                        return const SizedBox();
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: state.warehouses.length,
              ),
            ],
          );

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
