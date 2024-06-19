import 'package:flutter_modular/flutter_modular.dart';
import 'package:netflix_app/dashboard/dashboard_module.dart';
import 'package:netflix_app/login/login_module.dart';

class CoreModule extends Module {
  @override
  void routes(r) {
    r.module('/', module: LoginModule());
    r.module('/dashboard', module: DashboardModule());
  }
}
