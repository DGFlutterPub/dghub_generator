import mongoose from "mongoose";
import tools from '../../../system/tools/tools.js';
import Auth from '../models/auth.js';

export default async (req, res, next) => {
  
 var id = new mongoose.Types.ObjectId();

 


 try{
var data = await new Auth({
    _id: id,
    email: req.body.email ,
password: req.body.password ,
roles: req.body.roles ,

  }).save();

 return res.status(200).json(data);
 }catch(e){
 console.log(e);
  return res.status(200).json('Store failed');
 }

}