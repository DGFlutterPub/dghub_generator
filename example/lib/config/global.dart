import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

const isDevMode = true;

const appName = 'Example (DG)';

const appPackageName = 'dev.dghub.example';

const devUrl = 'http://127.0.0.1:6001';
const baseUrl = 'https://your-production-url';

const apiVersion = 'v1';
const socketVersion = 'v1';

const hostUrl = isDevMode ? devUrl : baseUrl;

const apiUrl = '$hostUrl/api/$apiVersion/';

var globalRef = ProviderContainer();

var secertKey =
    'a5HqSZZ3jYIuufrD3afk25exxS08YI3wBqpScJz9qz7ugG7YCQUcNGS29XRVLqHe';

var publicKey =
    'e5HqSZZ3jYIuufrD3afk25exxS08YI3wBqpSMJz9qz7ugG7YCQUcNGS29XRVLqHa';

Logger logger = Logger();
