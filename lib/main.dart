import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_supabase_app/app/constants/supabase_const.dart';
import 'package:getx_supabase_app/app/constants/widget_const.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SUPABASE_URL,
    anonKey: SUPABASE_KEY,
  );

  runApp(
    GetMaterialApp(
      title: "Supabase Chat",
      theme: appTheme,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
