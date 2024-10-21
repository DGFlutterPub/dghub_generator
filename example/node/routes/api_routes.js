import global from '../config/global.js';

import ProductApi from '../gen/product/apis/product_api.js';
/*import*/


export default (app)=>{
    
  app.use('/api/'+global.apiVersion, ProductApi);
      /*form*/
      
    
}