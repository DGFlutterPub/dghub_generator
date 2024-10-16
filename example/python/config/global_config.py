packageName = 'dev.dghub.example'
secertKey = 'a5HqSZZ3jYIuufrD3afk25exxS08YI3wBqpScJz9qz7ugG7YCQUcNGS29XRVLqHe'
publicKey = 'e5HqSZZ3jYIuufrD3afk25exxS08YI3wBqpSMJz9qz7ugG7YCQUcNGS29XRVLqHa'

isDevMode = 'true'

devUrl = 'http://localhost:6001'
baseUrl = 'https://your-production-url'

port = 6001
apiVersion = 'v1'
socketVersion = 'v1'

hostUrl = ''
if isDevMode == 'true':
 hostUrl = devUrl 
else :
 hostUrl = baseUrl
 
host = devUrl.split(':')[1].replace('//','')

apiUrl = hostUrl + '/api/' + apiVersion + '/'