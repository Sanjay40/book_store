import 'package:book_store/app_export.dart';
import 'package:book_store/view/homepage_module/homepage_view.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Injector injector = Injector();
  runApp(
     GetMaterialApp(
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.poppins(),
          // titleTextStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        textTheme: TextTheme(
         bodyMedium: GoogleFonts.poppins(),
          titleLarge: GoogleFonts.poppins(),
        ),
        splashColor: BookStoreColor.transparent,

      ),
      //home: HomePageView(),
      home: const SplashView(),
    ),
  );
}

