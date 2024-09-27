import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'routes.gr.dart';

//--flutter pub run build_runner build --delete-conflicting-outputs

@AutoRouterConfig()
class Routes extends RootStackRouter {
  final WidgetRef ref;
  Routes({required this.ref});
  @override
  List<AutoRoute> get routes => [
        // CustomRoute(initial: true, page: PermissionRoute.page),
      ];
}
