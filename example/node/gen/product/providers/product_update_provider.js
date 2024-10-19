import tools from '../../../system/tools/tools.js';
import Product from '../models/product.js';

export default async (req, res, next) => {
  
   var id = req.params["id"];

   

 try{
var data = await Product.findOneAndUpdate(
    {_id: id},
    {title: req.body.title,
price: req.body.price,
enabled: req.body.enabled,
}
  );
 return res.status(200).json(data);
 }catch(e){
  console.log(e);
  return res.status(200).json('Update failed');
 }

}