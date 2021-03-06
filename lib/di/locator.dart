import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

// importing controllers
import '../controllers/nav_bar_controller.dart';

// importing services
import '../services/navigation_services.dart';

final locator = GetIt.instance;

void init() {
  // init controllers
  final NavBarController navBarController = Get.put(NavBarController());
  locator.registerLazySingleton(() => navBarController);

  // init services
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
}
