import 'package:get_storage/get_storage.dart';
import 'package:mir_expense_tracker/Utils/my_colors.dart';
import 'package:mir_expense_tracker/constants.dart';
import 'package:mir_expense_tracker/controllers/MenuAppController.dart';
import 'package:mir_expense_tracker/routes/app_pages.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mir_expense_tracker/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';


initAllServices() async {
  Get.log('starting all services ...');

  await GetStorage.init();
  // await Get.putAsync<SettingsService>(() async => SettingsService());
  await Get.putAsync<AuthService>(() async => AuthService());
  Get.log('All services started...');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await initAllServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuAppController(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter mir_crm Panel',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: MyColors.purpleDark,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    );
  }
}
