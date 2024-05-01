import 'package:dghub_generator/dghub_generator.dart';

@DGHubGenerator(
  models: [
    DGModel(key: 'name', defaultValue: 'mg mg'),
  ],
)
class UserGenerator {}