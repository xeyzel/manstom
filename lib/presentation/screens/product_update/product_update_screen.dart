import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/core/constant/string_resource.dart';
import 'package:inventory_app/data/model/product/product.dart';
import 'package:inventory_app/presentation/screens/create_product/cubit/create_product_cubit.dart';
import 'package:inventory_app/presentation/screens/create_product/cubit/create_product_state.dart';
import 'package:inventory_app/presentation/widgets/center_loading.dart';

class ProductUpdateScreen extends StatefulWidget {
  final Product product;

  const ProductUpdateScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {
  final _name = TextEditingController();
  final _description = TextEditingController();

  _initial() {
    _name.text = widget.product.name;
    _description.text = widget.product.description;
  }

  @override
  void initState() {
    _initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Change Name & Description',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Image.network(widget.product.image, height: 200),
                const SizedBox(height: 16),
                Text(
                  'Price: ${widget.product.price}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Quantity: ${widget.product.quantity}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _description,
                  decoration: const InputDecoration(label: Text('Description')),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: BlocConsumer<CreateProductCubit, CreateProductState>(
                    listenWhen: (previous, current) {
                      return previous.status != current.status;
                    },
                    listener: (context, state) {
                      if (state.status == Status.success) {
                        context.read<CreateProductCubit>().findAllProduct();
                      }
                    },
                    builder: (context, state) {
                      if (state.status == Status.loading) {
                        return const CenterLoading();
                      }

                      return ElevatedButton(
                        onPressed: () {
                          final product = widget.product.copyWith(
                            name: _name.text,
                            description: _description.text,
                          );

                          context
                              .read<CreateProductCubit>()
                              .updateProduct(product);
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
        ));
  }
}
