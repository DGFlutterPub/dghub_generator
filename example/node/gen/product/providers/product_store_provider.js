import mongoose from "mongoose";
import tools from '../../../system/tools/tools.js';
import Product from '../models/product.js';

export default async (req, res, next) => {
  
 var id = new mongoose.Types.ObjectId();

 


 try{
var data = await new Product({
    _id: id,
    title: req.body.title ,
price: req.body.price ,
enabled: req.body.enabled ,

  }).save();

 return res.status(200).json(data);
 }catch(e){
 console.log(e);
  return res.status(200).json('Store failed');
 }

}