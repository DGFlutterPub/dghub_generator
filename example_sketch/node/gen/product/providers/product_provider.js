import mongoose from "mongoose";
import Product from "../models/poduct.js";

export default async (req,res,next) =>{
    var id = req.params["id"];
    try {
        var product = await Product.findOne({_id: id});
        if(product == null){
            return res.status(200).json('Product not found');  
        }
        return res.status(200).json(product); 
    } catch (error) {
        console.log(error);
        return res.status(200).json('Product not found');
    }
  
}