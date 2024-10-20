import global from '../config/global.js';


import AuthApi from '../gen/auth/apis/auth_api.js';
import ProductApi from '../gen/product/apis/product_api.js';
/*import*/



export default (app)=>{
    
  app.use('/api/'+global.apiVersion, AuthApi);
       app.use('/api/'+global.apiVersion, ProductApi);
      /*form*/
      
      
    
}