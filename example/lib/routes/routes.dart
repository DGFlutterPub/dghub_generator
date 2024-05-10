import 'package:auto_route/auto_route.dart';

import '../system/permission/permission_page.dart';

part 'routes.gr.dart';

//--flutter pub run build_runner build --delete-conflicting-outputs

@AutoRouterConfig()
class Routes extends _$Routes {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(initial: true, page: PermissionRoute.page),
      ];
}
