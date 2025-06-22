import 'package:geonotes/services/dataLayer/app_data_layer.dart';
import 'package:get_it/get_it.dart';

void setup() {
  GetIt.I.registerSingleton<AppDataLayer>(AppDataLayer()..loadDataFromSupabase());
}
