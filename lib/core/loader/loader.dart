import 'package:get/get.dart';

abstract class Loader {
  bool isLoading;

  Loader({required this.isLoading});

  void startLoading();

  void stopLoading();
}

class ComponentLoader extends Loader {
  final GetxController? view;
  ComponentLoader({super.isLoading = true, required this.view});

  @override
  void startLoading() {
    isLoading = true;
    view?.update();
  }

  @override
  void stopLoading() {
    isLoading = false;
    view?.update();
  }
}
