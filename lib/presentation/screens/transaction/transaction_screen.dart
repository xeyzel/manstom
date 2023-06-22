import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/status.dart';
import 'package:inventory_app/core/constant/string_resource.dart';
import 'package:inventory_app/core/util/utils.dart';
import 'package:inventory_app/presentation/screens/transaction/cubit/transaction_cubit.dart';
import 'package:inventory_app/presentation/screens/transaction/cubit/transaction_state.dart';
import 'package:inventory_app/presentation/widgets/center_loading.dart';
import '../../widgets/custom_app_bar.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<TransactionCubit>().findAllTransaction();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: const CustomAppBar(
        title: StringResource.transaction,
      ),
      body: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const CenterLoading();
          }

          if (state.transactions.isEmpty) {
            return const Center(
              child: Text('There Is No Transaction'),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
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
                    Image.asset(
                        'assets/images/${transaction.isIncrease ? 'up-arrow.png' : 'download.png'}',
                        width: 30),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: state.transactions.length,
          );
        },
      ),
    );
  }
}
