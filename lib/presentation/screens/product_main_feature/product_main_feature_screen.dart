import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/data/model/product/product.dart';
import 'package:inventory_app/presentation/screens/product_main_feature/cubit/product_main_feature_cubit.dart';
import 'package:inventory_app/presentation/screens/product_main_feature/cubit/product_main_feature_state.dart';
import 'package:inventory_app/presentation/widgets/center_loading.dart';
import 'package:inventory_app/presentation/widgets/custom_app_bar.dart';

class ProductMainFeatureScreen extends StatefulWidget {
  final Product product;
  final bool isFromHome;

  const ProductMainFeatureScreen({
    super.key,
    required this.product,
    this.isFromHome = false,
  });

  @override
  State<ProductMainFeatureScreen> createState() =>
      _ProductMainFeatureScreenState();
}

class _ProductMainFeatureScreenState extends State<ProductMainFeatureScreen> {
  final _price = TextEditingController();
  final _quantity = TextEditingController();

  void _initial() {
    _price.text = widget.product.price.toString();
    _quantity.text = widget.product.quantity.toString();

    final bloc = context.read<ProductMainFeatureCubit>();
    bloc.setPrice(widget.product.price);
    bloc.setQuantity(widget.product.quantity);
  }

  @override
  void initState() {
    _initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Main Feature'),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Change Price & Quantity',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 36),
              Text(
                widget.product.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                clipBehavior: Clip.hardEdge,
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Image.network(
                  widget.product.image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Description: ${widget.product.description}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Warehouse: ${widget.product.warehouseName}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                keyboardType: TextInputType.number,
                controller: _price,
                decoration: const InputDecoration(
                  label: Text('Change Price'),
                ),
              ),
              Container(
                width: 180,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: BlocBuilder<ProductMainFeatureCubit,
                    ProductMainFeatureState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        Switch(
                          value: state.isAdded,
                          onChanged: context
                              .read<ProductMainFeatureCubit>()
                              .setIsAdded,
                        ),
                        Text(
                          state.isAdded ? "Decrease" : 'Increase',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: state.isAdded ? Colors.red : Colors.green,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              BlocBuilder<ProductMainFeatureCubit, ProductMainFeatureState>(
                builder: (context, state) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Quantity Now : ${state.product.quantity}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              TextField(
                keyboardType: TextInputType.number,
                controller: _quantity,
                decoration: const InputDecoration(
                  label: Text('Change Quantity'),
                ),
              ),
              const SizedBox(height: 24),
              BlocConsumer<ProductMainFeatureCubit, ProductMainFeatureState>(
                listenWhen: (previous, current) {
                  return previous.status != current.status;
                },
                listener: (context, state) {
                  if (state.status == Status.success) {
                    Navigator.pop(context);
                    if (!widget.isFromHome) {
                      Navigator.pop(context);
                    }
                  }
                },
                builder: (context, state) {
                  if (state.status == Status.loading) {
                    return const CenterLoading();
                  }

                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        final price = int.parse(_price.text);
                        final quantity = int.parse(_quantity.text);

                        context.read<ProductMainFeatureCubit>().setPrice(price);
                        context
                            .read<ProductMainFeatureCubit>()
                            .setQuantity(quantity);

                        final newProduct = widget.product.copyWith(
                          price: price,
                          quantity: quantity,
                        );

                        context
                            .read<ProductMainFeatureCubit>()
                            .updateProduct(newProduct);
                      },
                      child: const Text('Save'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
