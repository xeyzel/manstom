import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app/core/constant/route_name.dart';
import 'package:inventory_app/core/theme/custom_theme.dart';
import 'package:inventory_app/presentation/screens/create_product/create_product_screen.dart';
import 'package:inventory_app/presentation/screens/create_product/cubit/create_product_cubit.dart';
import 'package:inventory_app/presentation/screens/create_warehouse/create_warehouse_screen.dart';
import 'package:inventory_app/presentation/screens/create_warehouse/cubit/create_warehouse_cubit.dart';
import 'package:inventory_app/presentation/screens/login/cubit/login_cubit.dart';
import 'package:inventory_app/presentation/screens/login/login_screen.dart';
import 'package:inventory_app/presentation/screens/product/product_screen.dart';
import 'package:inventory_app/presentation/screens/product_main_feature/cubit/product_main_feature_cubit.dart';
import 'package:inventory_app/presentation/screens/profile/cubit/profile_cubit.dart';
import 'package:inventory_app/presentation/screens/register/cubit/register_cubit.dart';
import 'package:inventory_app/presentation/screens/register/register_screen.dart';
import 'package:inventory_app/presentation/screens/splash/cubit/splash_cubit.dart';
import 'package:inventory_app/presentation/screens/transaction/cubit/transaction_cubit.dart';
import 'package:inventory_app/presentation/screens/transaction/transaction_screen.dart';

import 'presentation/screens/home/bloc/home_cubit.dart';
import 'presentation/screens/home/home_screen.dart';
import 'presentation/screens/splash/splash_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => ProductMainFeatureCubit()),
        BlocProvider(create: (context) => TransactionCubit()),
        BlocProvider(create: (context) => SplashCubit()),
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => CreateWarehouseCubit()),
        BlocProvider(create: (context) => CreateProductCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.themeData,
        initialRoute: RouteName.splash,
        routes: {
          RouteName.splash: (context) => const SplashScreen(),
          RouteName.home: (context) => const HomeScreen(),
          RouteName.login: (context) => const LoginScreen(),
          RouteName.createProduct: (context) => const CreateProductScreen(),
          RouteName.register: (context) => const RegisterScreen(),
          RouteName.listProduct: (context) => const ProductScreen(),
          RouteName.transaction: (context) => const TransactionScreen(),
          RouteName.createWarehouse: (context) => const CreateWarehouseScreen(),
        },
      ),
    );
  }
}
