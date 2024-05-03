import 'package:dghub_generator/dghub_generator.dart';

enum DGMethod { get, post, put, delete }

enum DGAction {
  getOne,
  getAll,
  getPaganated,
  deleteForever,
  recover,
  delete,
  store,
  update
}

class DGRoute {
  final String? url;
  final String name;
  final DGMethod method;
  final DGAction action;
  final bool realTime;
  final List<DGModel>? headers;
  final List<DGModel>? params;
  final List<DGModel>? queries;

  const DGRoute({
    this.url,
    required this.name,
    required this.method,
    required this.action,
    this.realTime = false,
    this.headers,
    this.params,
    this.queries,
  });
}
