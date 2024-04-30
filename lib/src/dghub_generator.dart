import 'package:dghub_generator/dghub_generator.dart';
import 'package:dghub_generator/src/models/dg_socket.dart';

import 'models/dg_page.dart';

class DGHubGenerator {
  final List<DGModel>? models;
  final DGController? controller;
  final DGSocket? socket;
  final List<DGPage>? pages;
  final DGConfig? config;
  const DGHubGenerator(
      {this.config, this.models, this.controller, this.socket, this.pages});
}
