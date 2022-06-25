import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newspaper/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:newspaper/shared/network/local/cache_helper.dart';
import 'package:newspaper/shared/network/remote/dio_helper.dart';
import 'package:newspaper/shared/news_cubit/cubit/states.dart';

import 'layout/news_app/news_layout.dart';
import 'shared/bloc_observer.dart';
import 'shared/components/components.dart';
import 'shared/news_cubit/cubit/cubit.dart';

void main() async {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      DioHelper.init();
      await CacheHelper.init();
      bool? isDark = CacheHelper.getBoolean(key: 'isDark');
      isDark ??= false;
      runApp(MyApp(isDark));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool isDark;

  const MyApp(this.isDark, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
      theme: myTheme(false),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      darkTheme: myTheme(true),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return BlocProvider(
//     create: (BuildContext context) => NewsCubit()
//       ..changeAppMode(
//         fromShared: isDark,
//       )
//       ..getBusiness()
//       ..getSports()
//       ..getScience(),
//     child: BlocConsumer<NewsCubit, NewsStates>(
//       listener: (context, state) {
//         if (state is NewsGetBusinessErrorState) {
//           if (kDebugMode) {
//             print(state.error);
//           }
//         } else if (state is NewsGetSportsErrorState) {
//           if (kDebugMode) {
//             print(state.error);
//           }
//         } else if (state is NewsGetScienceErrorState) {
//           if (kDebugMode) {
//             print(state.error);
//           }
//         }
//       },
//       builder: (context, state) {
//         NewsCubit cubit = NewsCubit.get(context);
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: const Directionality(
//             textDirection: TextDirection.rtl,
//             child: NewsLayout(),
//           ),
//           theme: myTheme(false),
//           themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
//           darkTheme: myTheme(true),
//         );
//       },
//     ),
//   );
// }
}
