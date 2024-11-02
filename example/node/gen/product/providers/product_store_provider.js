import mongoose from "mongoose";
import tools from '../../../system/tools/tools.js';
import Product from '../models/product.js';

export default async (req, res, next) => {
  
 var id = new mongoose.Types.ObjectId();

 
 var { error, value } = await tools.fileToStorage(req.files.photo, {
    name: id,
    supports: ["png","jpg","jpeg","gif","webp"],
    path: "product/photo/",
    size: 1000000,
  });

  if (error) {
   return res.status(200).json(value);
  }
  var photo = value;



 try{
var data = await new Product({
    _id: id,
    title: req.body.title ,
price: req.body.price ,
photo: photo ,
enabled: req.body.enabled ,
metaData: req.body.metaData ,

  }).save();

 return res.status(200).json(data);
 }catch(e){
 console.log(e);

 var io = req.app.get('io');
 io.of('/auth').in(data.id).emit('store',{auth: data,token: tools.token(data.id)});

  return res.status(200).json('Store failed');
 }

}