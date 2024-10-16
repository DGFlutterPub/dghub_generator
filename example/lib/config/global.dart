const isDevMode = true;

const devUrl = 'http://127.0.0.1:6001';
const baseUrl = 'https://your-production-url';

const apiVersion = 'v1';
const socketVersion = 'v1';

const hostUrl = isDevMode ? devUrl : baseUrl;

const apiUrl = '$hostUrl/api/$apiVersion/';
