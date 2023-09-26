import 'package:api/cubit/cubit/product_cubit.dart';
import 'package:api/cubit/main/main_cubit.dart';
import 'package:api/screens/home_screen.dart';
import 'package:api/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => MainCubit()),
          BlocProvider(create: (context) => ProductCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ProductScreen(),
        ));




    
  }
}