import Product from '../models/product.js';

export default async (req, res, next)  => {
  var id = req.params["id"];
 

 try{
 var data = await Product.findOne({ _id: id }).exec();
return res.json(data);
 }catch(e){
 return res.status(200).json("This Product is not exists" );
 }
 
 
   
}