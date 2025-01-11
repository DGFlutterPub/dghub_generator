import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

const appName = 'Example (DG)';
const appPackageName = 'dev.dghub.example';

const isProductionMode = true;

const devUrl = 'http://127.0.0.1';
const baseUrl = 'http://127.0.0.1';

const apiVersion = 'v1';
const socketVersion = 'v1';

const hostUrl = isProductionMode ? baseUrl : devUrl;

const apiUrl = '$hostUrl/api/$apiVersion/';

const secertKey =
    'a5HqSZZ3jYIuufrD3afk25exxS08YI3wBqpScJz9qz7ugG7YCQUcNGS29XRVLqHe';
const publicKey =
    'e5HqSZZ3jYIuufrD3afk25exxS08YI3wBqpSMJz9qz7ugG7YCQUcNGS29XRVLqHa';

var globalRef = ProviderContainer();

Logger logger = Logger();

Directory? globalDir;
