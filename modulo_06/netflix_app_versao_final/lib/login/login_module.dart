import 'package:flutter_modular/flutter_modular.dart';
import 'package:netflix_app/login/presentation/components/login_controller.dart';

import 'presentation/views/login_view.dart';
import 'presentation/views/recovery_password_view.dart';

class LoginModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(() => LoginController());
  }

  @override
  void routes(r) {
    r.child('/',
        child: (context) => LoginView(
              controller: Modular.get<LoginController>(),
            ));
    r.child('/recovery', child: (context) => const RecoveryPasswordView());
  }
}
