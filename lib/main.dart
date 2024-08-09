import 'package:customer_laundry_app/core/common/theme/theme.dart';
import 'package:customer_laundry_app/core/injection/injection.dart';
import 'package:customer_laundry_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:customer_laundry_app/features/auth/presentation/pages/register_page.dart';
import 'package:customer_laundry_app/features/bottom_nav_bar/cubit/bottom_nav_bar_cubit.dart';
import 'package:customer_laundry_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:customer_laundry_app/features/home/presentation/pages/home_page.dart';
import 'package:customer_laundry_app/features/main/presentation/bloc/main_bloc.dart';
import 'package:customer_laundry_app/features/main/presentation/pages/main_page.dart';
import 'package:customer_laundry_app/features/order/presentation/bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjection();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => getIt<AuthBloc>()),
        BlocProvider<HomeBloc>(create: (_) => getIt<HomeBloc>()),
        BlocProvider<MainBloc>(create: (_) => getIt<MainBloc>()),
        BlocProvider<OrderBloc>(create: (_) => getIt<OrderBloc>()),
        BlocProvider<BottomNavBarCubit>(
            create: (_) => getIt<BottomNavBarCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            theme: themeData,
            home: MainPage(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
