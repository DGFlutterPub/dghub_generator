import 'package:dghub_generator/src/models/dg_script.dart';
import 'package:json_annotation/json_annotation.dart';
part 'dg_api.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class DGApi {
  final String? url;
  final String? path;
  final DGApiMethod method;
  final DGApiAction action;
  final bool realTime;
  final bool autoDispose;
  final bool preRefresh;
  final bool authenticated;
  final bool controlAuthenticatedOnly;
  final List<String> roles;
  final List<Map<String, dynamic>>? headers;
  final bool enabledForm;
  final bool saveToLocalStorage;
  final String getOneKey;
  final List<DGScript> scripts;
  const DGApi({
    this.url,
    required this.method,
    required this.action,
    this.realTime = false,
    this.autoDispose = false,
    this.preRefresh = false,
    this.authenticated = false,
    this.roles = const [],
    this.headers,
    this.path,
    this.enabledForm = true,
    this.saveToLocalStorage = false,
    this.getOneKey = 'id',
    this.controlAuthenticatedOnly = false,
    this.scripts = const [],
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
  destroyAllForever,
  destroyAll,
  destroy,
  store,
  update,
  login,
  register,
  profile,
  forgotPasswordSend,
  forgotPasswordUpdate,
  emailVerificationSend,
  emailVerificationUpdate
}
