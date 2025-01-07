import 'package:academia/configs/configs.dart';
import 'package:academia/database/database.dart';
import 'package:academia/features/features.dart';
import 'package:academia/utils/router/router.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class Academia extends StatelessWidget {
  const Academia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GetIt getIt = GetIt.instance;
    // Inject the application database
    getIt.registerSingletonIfAbsent<AppDatabase>(
      () => AppDatabase(),
      instanceName: "cacheDB",
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => ProfileCubit()),
        BlocProvider(create: (_) => CourseCubit()),
      ],
      child: DynamicColorBuilder(
        builder: (lightscheme, darkscheme) => MaterialApp.router(
          title: getIt<FlavorConfig>().appName,
          routerConfig: AcademiaRouter.router,
          theme: ThemeData(
            colorScheme: lightscheme,
            useMaterial3: true,
            fontFamily: GoogleFonts.inter().fontFamily,
          ),
        ),
      ),
    );
  }
}
