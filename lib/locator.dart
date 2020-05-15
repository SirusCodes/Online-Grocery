import 'package:get_it/get_it.dart';
import 'package:online_grocery/get_it/images_get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<ImagesGetIt>(ImagesGetIt());
}
