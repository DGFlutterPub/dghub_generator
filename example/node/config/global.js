const packageName = 'dev.dghub.example';
const secertKey = 'a5HqSZZ3jYIuufrD3afk25exxS08YI3wBqpScJz9qz7ugG7YCQUcNGS29XRVLqHe';
const publicKey = 'e5HqSZZ3jYIuufrD3afk25exxS08YI3wBqpSMJz9qz7ugG7YCQUcNGS29XRVLqHa';

const isDevMode = true;

const devUrl = 'http://127.0.0.1:6001';
const baseUrl = 'https://your-production-url';

const port = 6001;
const apiVersion = 'v1';
const socketVersion = 'v1';

const hostUrl = isDevMode ? devUrl : baseUrl;
const host = devUrl.split(':')[1].replace('//','');

const apiUrl = hostUrl + '/api/' + apiVersion + '/';

const mailPort = '';
const mailHost = '';
const mailUsername = '';
const mailPassword ='';

export default { 
    mailHost,
    mailPort,
    mailPassword,
    mailUsername,
    port,host, secertKey,publicKey, isDevMode, devUrl, baseUrl, apiVersion, socketVersion, hostUrl, apiUrl ,packageName}
