import 'package:bompreco/app/modules/minhas_reservas/minhas_reservas_controller.dart';
import 'package:get/get.dart';

class MinhasReservasBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MinhasReservasController>(() => MinhasReservasController());
  }
}
