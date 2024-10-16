import 'package:json_annotation/json_annotation.dart';
part 'dg_api.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DGApi {
  final String? url;
  final DGApiMethod method;
  final DGApiAction action;
  final bool realTime;
  final bool autoDispose;
  final bool preRefresh;
  final List<Map<String, dynamic>>? headers;

  const DGApi({
    this.url,
    required this.method,
    required this.action,
    this.realTime = false,
    this.autoDispose = false,
    this.preRefresh = false,
    this.headers,
  });

  factory DGApi.fromJson(Map<String, dynamic> json) => _$DGApiFromJson(json);
  Map<String, dynamic> toJson() => _$DGApiToJson(this);
}

enum DGApiMethod { get, post, put, delete }

enum DGApiAction {
  getOne,
  getAll,
  getOneRecovery,
  getAllRecovery,
  recoverOne,
  recoverAll,
  destroyForever,
  destroyAll,
  destroy,
  store,
  update
}
