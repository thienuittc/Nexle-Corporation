import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'global/locator.dart';
import 'global/providers.dart';
import 'global/router.dart';
import 'ui/utils/navigation_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configLoading();
  await setupLocator();
  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 500)
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.black
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.black
    ..textColor = Colors.black
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MultiProvider(
      providers: [...viewModelProviders],
      child: ScreenUtilInit(
        designSize: const Size(375, 818),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) {
          return GetMaterialApp(
            builder: EasyLoading.init(),
            title: 'Nexle Corporation',
            navigatorKey: NavigationUtils.navigatorKey,
            onGenerateRoute: (settings) => MyRouter.generateRoute(settings),
            initialRoute: MyRouter.register,
            theme: ThemeData(
              checkboxTheme: CheckboxThemeData(
                side: MaterialStateBorderSide.resolveWith(
                  (states) => const BorderSide(
                    width: 1.0,
                    color: Color(
                      0xffD3D3D3,
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    2.0.r,
                  ),
                ),
                checkColor: MaterialStateProperty.all(
                  const Color(
                    0xffFFFFFF,
                  ),
                ),
              ),
              scaffoldBackgroundColor: Colors.white,
              textTheme:
                  GoogleFonts.beVietnamProTextTheme(Theme.of(context).textTheme)
                      .apply(
                bodyColor: Colors.black,
              ),
            ),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
