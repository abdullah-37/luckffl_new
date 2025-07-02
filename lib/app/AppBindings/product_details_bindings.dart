import 'package:get/get.dart';
import 'package:luck_ffle/app/Controllers/product_details_controller.dart';

class ProductDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsController>(() => ProductDetailsController());
  }
}
