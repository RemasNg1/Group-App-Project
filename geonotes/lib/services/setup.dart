import 'package:geonotes/layer_data/auth_layer.dart';
import 'package:geonotes/services/dataLayer/app_data_layer.dart';
import 'package:get_it/get_it.dart';

void setup() async {
  GetIt.I.registerSingleton<AuthLayer>(AuthLayer());
    GetIt.I.registerSingleton<AppDataLayer>(AppDataLayer()..loadDataFromSupabase());
}