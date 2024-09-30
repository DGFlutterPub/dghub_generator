import tools from '../../../system/tools/tools.js';

export default (body)=>{

   return tools.validator(body, 
    {
    email: tools.validate.string().email({ tlds: { allow: false } }).required()
  });  

}
 

