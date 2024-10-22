import mongoose from "mongoose";
import tools from '../../../system/tools/tools.js';
import Auth from '../models/auth.js';

export default async (req, res, next) => {
  
 try{
var data = await Auth.findOne({email: req.body.email}).select("+password");

var { error, value } = tools.checkPassword(req.body.password,data.password);
if (error) return res.status(200).json(value);  
  
  var data = await Auth.findOne({email: data.email},{token: tools.getToken()}).select("-password").update();

 return res.status(200).json(data);
 }catch(e){
 console.log(e);
  return res.status(200).json('Login failed');
 }
}