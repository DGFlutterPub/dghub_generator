import 'package:dghub_generator/dghub_generator.dart';
import 'package:dghub_generator/src/models/dg_page.dart';
import 'package:dghub_generator/src/models/dg_socket.dart';

@DGHubGenerator(models: [DGModel(key: 'key')], controller: DGController())
class UserMain {}
