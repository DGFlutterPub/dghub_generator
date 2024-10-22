import global from '../config/global.js';

import ProductApi from '../gen/product/apis/product_api.js';
import AuthApi from '../gen/auth/apis/auth_api.js';
/*import*/



export default (app)=>{
    
  app.use('/api/'+global.apiVersion, ProductApi);
       app.use('/api/'+global.apiVersion, AuthApi);
      /*form*/
      
      
    
}