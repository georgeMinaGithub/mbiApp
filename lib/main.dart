import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mbi_app_flutter/home/bmi_calculator.dart';
import 'package:mbi_app_flutter/shared/app_cubit/cubit.dart';
import 'package:mbi_app_flutter/shared/app_cubit/states.dart';
import 'package:mbi_app_flutter/styles/bloc_observer.dart';
import 'package:mbi_app_flutter/styles/themes.dart';


import 'network/cach_helper.dart';
import 'network/dio_helper.dart';
void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  // BlocOverrides.runZoned(
  //       () {},
  //   blocObserver: MyBlocObserver() ,
  // );
  DioHelper.init();
  await CacheHelper.init();

  late bool? isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp(Myapp(
    // startWidget: widget ,
    isDark: isDark,
  ));
}

class Myapp extends StatelessWidget {
  final  bool? isDark;

  const Myapp({Key? key,
    this.isDark}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ModeCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ) ,
      ],
      child: BlocConsumer<ModeCubit, ModeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ModeCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: const BmiCalculator(),
          );
        },
      ),
    );
  }
}