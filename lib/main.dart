import 'package:amrap/core/constants.dart';
import 'package:amrap/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  //Add localization here
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'AMRAP',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            fontFamily: 'Poppins',
            primarySwatch: Colors.amber,
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: const AppBarTheme(
                color: Colors.transparent,
                iconTheme: IconThemeData(color: primaryCol)),
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          routerConfig: Routes.router,
        );
      },
    );
  }
}
