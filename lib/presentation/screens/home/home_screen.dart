import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/presentation/screens/product/product_screen.dart';
import 'package:inventory_app/presentation/screens/profile/profile_screen.dart';
import 'package:inventory_app/presentation/screens/transaction/transaction_screen.dart';
import 'package:inventory_app/presentation/screens/warehouse/warehouse_screen.dart';

import 'bloc/home_cubit.dart';
import 'bloc/home_state.dart';
import 'section/home_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _screens = [
    const HomeSection(),
    const WarehouseScreen(),
    const TransactionScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return _screens.elementAt(state.index);
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final index = state.index;

          return BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            currentIndex: index,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            onTap: (value) => context.read<HomeCubit>().setIndex(value),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.warehouse),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: '',
              ),
            ],
          );
        },
      ),
    );
  }
}
