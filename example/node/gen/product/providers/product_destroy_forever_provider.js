import Product from '../models/product.js';

export default async (req, res, next) => {
   var id = req.params["id"];

   try{
 var data = await Product.deleteOne({_id: id});

 return res.status(200).json(data);
   
 }catch(e){
  return res.status(200).json('Delete failed');
 }
}