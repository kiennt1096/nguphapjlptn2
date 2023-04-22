import 'package:get/route_manager.dart';
import 'package:nguphapn2_app/core.dart';

part 'app_routes.dart';

class AppPage {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.main,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.listgrammar,
      page: () => const ListGrammarView(),
      binding: ListGrammarBinding(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.grammar,
      page: () => const GrammarView(),
      binding: GrammarBinding(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.favourite,
      page: () => const FavouriteListView(),
      binding: FavouriteListBinding(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.mondai,
      page: () => const MondaiView(),
      binding: MondaiBinding(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
    )
  ];
}
