const packageName = 'dev.dghub.example';
const secertKey = 'a5HqSZZ3jYIuufrD3afk25exxS08YI3wBqpScJz9qz7ugG7YCQUcNGS29XRVLqHe';
const publicKey = 'e5HqSZZ3jYIuufrD3afk25exxS08YI3wBqpSMJz9qz7ugG7YCQUcNGS29XRVLqHa';

const isDevMode = true;

const devUrl = 'http://localhost:6001';
const baseUrl = 'https://your-production-url';

const port = 6001;
const apiVersion = 'v1';
const socketVersion = 'v1';

const hostUrl = isDevMode ? devUrl : baseUrl;
const host = devUrl.split(':')[1].replace('//','');

const apiUrl = hostUrl + '/api/' + apiVersion + '/';

export default {port,host, secertKey,publicKey, isDevMode, devUrl, baseUrl, apiVersion, socketVersion, hostUrl, apiUrl ,packageName}
