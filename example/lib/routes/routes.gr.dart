// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$Routes extends RootStackRouter {
  // ignore: unused_element
  _$Routes({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    PermissionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PermissionPage(),
      );
    }
  };
}

/// generated route for
/// [PermissionPage]
class PermissionRoute extends PageRouteInfo<void> {
  const PermissionRoute({List<PageRouteInfo>? children})
      : super(
          PermissionRoute.name,
          initialChildren: children,
        );

  static const String name = 'PermissionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
