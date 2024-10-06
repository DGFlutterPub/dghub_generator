import mongoose from "mongoose";
import Product from "../models/poduct.js";

export default async (req,res,next) =>{

    try {
        var page = req.query.page||1;
        var limit = 20;
        var total = await Product.countDocuments();
        var products = await Product.aggregate([                    
            { $skip: page * limit },
            { $limit: limit }
        ]);
        
        return res.status(200).json({
            data: products,
            total: total,
            currentPage: page,
            totalPage:  Math.ceil(total / limit)
        }); 
    } catch (error) {
        console.log(error);
        return res.status(200).json('Product not found');
    }
  
}