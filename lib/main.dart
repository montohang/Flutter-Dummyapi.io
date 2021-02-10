import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_thesportdb/cubit/team_cubit.dart';
import 'package:flutter_thesportdb/ui/pages/pages.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'cubit/league_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LeagueCubit(),
        ),
        BlocProvider(
          create: (context) => TeamCubit(),
        ),
      ],
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false, home: SplashScreen()),
    );
  }
}
