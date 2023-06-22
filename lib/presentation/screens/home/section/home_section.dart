import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/route_name.dart';
import 'package:inventory_app/core/util/utils.dart';
import 'package:inventory_app/presentation/screens/home/bloc/home_cubit.dart';
import 'package:inventory_app/presentation/screens/home/bloc/home_state.dart';
import 'package:inventory_app/presentation/screens/product_main_feature/cubit/product_main_feature_cubit.dart';
import 'package:inventory_app/presentation/screens/product_main_feature/product_main_feature_screen.dart';
import 'package:inventory_app/presentation/screens/profile/cubit/profile_cubit.dart';
import 'package:inventory_app/presentation/screens/profile/cubit/profile_state.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().started();
    context.read<HomeCubit>().getProduct();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const CircleAvatar(),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome,',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        return Text(
                          state.user.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final products = state.allProduct;
              var totalPrice = 0;
              final totalProduct = state.allProduct.length;
              var totalQuantity = 0;

              for (var product in products) {
                totalQuantity += product.quantity;
                totalPrice += product.quantity*product.price;

              }
              return Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'My Assets :',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          Utils.formatNumberToIdr(totalPrice),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Types of Products : $totalProduct Types',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Total All Product : $totalQuantity Items',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Image.asset('assets/images/box.png', width: 80),
                  ],
                ),
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Main Feature',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: MaterialButton(
                    padding: const EdgeInsets.all(24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: Colors.cyan,
                    onPressed: () {
                      Navigator.pushNamed(context, RouteName.createWarehouse);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        Image.asset('assets/images/warehouse.png', width: 80),
                        const SizedBox(height: 8),
                        const Text(
                          'Warehouse',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: MaterialButton(
                    padding: const EdgeInsets.all(24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: Colors.cyan,
                    onPressed: () {
                      Navigator.pushNamed(context, RouteName.createProduct);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/images/add_product.png', width: 80),
                        const SizedBox(height: 8),
                        const Text(
                          'Product',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final totalProduct = state.products.length;
              if (state.products.isEmpty) {
                return const SizedBox.shrink();
              }
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/crisis.png', width: 30),
                            const SizedBox(width: 8),
                            const Text(
                              'Items To Be Restocked',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            '$totalProduct',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        return ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final product = state.products.elementAt(index);
                            return GestureDetector(
                              onTap: () {
                                context
                                    .read<ProductMainFeatureCubit>()
                                    .setProduct(product);
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return ProductMainFeatureScreen(
                                      product: product.copyWith(quantity: 0),
                                      isFromHome: true,
                                    );
                                  },
                                ));
                              },
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                width: 200,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey.shade400,
                                  ),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(product.image),
                                              fit: BoxFit.cover),
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 4,
                                              horizontal: 8,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              'Quantity : ${product.quantity}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 8);
                          },
                          itemCount: state.products.length,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Image.asset('assets/images/shopping.png', width: 30),
                const SizedBox(width: 8),
                const Text(
                  'Recently Added',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final product = state.newProducts.elementAt(index);
                    return Container(
                      clipBehavior: Clip.hardEdge,
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey.shade400,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(product.image),
                                    fit: BoxFit.cover),
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    'Quantity : ${product.quantity}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 8);
                  },
                  itemCount: state.newProducts.length,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Image.asset('assets/images/transaction.png', width: 30),
                const SizedBox(width: 8),
                const Text(
                  'Last Transaction',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state.transactions.isEmpty) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(16),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(offset: const Offset(0,5), blurRadius: 8, color: Colors.grey.shade300)],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/images/no-task.png', width: 100),
                      const SizedBox(height: 16),
                      const Text('There is No Transaction'),
                    ],
                  ),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final transaction = state.transactions.elementAt(index);
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 5),
                          blurRadius: 8,
                          color: Colors.grey.shade300,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                'ID : ' + transaction.idTransaction,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              margin: const EdgeInsets.only(bottom: 8),
                            ),
                            Text(
                              Utils.capital(transaction.productName),
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Warehouse : ' +
                                  transaction.warehouseName.toUpperCase(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            if (transaction.infoPrice != null &&
                                transaction.infoPrice!.isNotEmpty)
                              Text(
                                transaction.infoPrice.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.red),
                              ),
                            if (transaction.infoQuantity != null &&
                                transaction.infoQuantity!.isNotEmpty)
                              Text(
                                transaction.infoQuantity.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.red),
                              ),
                            Text(Utils.formatDate(transaction.createdAt)),
                          ],
                        ),
                        Image.asset('assets/images/${transaction.isIncrease? 'up-arrow.png' : 'download.png'}', width: 30),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
                itemCount: state.transactions.length,
              );
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
