import express from "express";
const router = express.Router();

import authenticated from '../../../middleware/api/authenticated.js';
import roles from '../../../middleware/api/roles.js';
import ProductStoreProvider from '../providers/product_store_provider.js';
import ProductProvider from '../providers/product_provider.js';
import ProductsProvider from '../providers/products_provider.js';
import ProductUpdateProvider from '../providers/product_update_provider.js';
import ProductDestroyProvider from '../providers/product_destroy_provider.js';
import ProductDestroyForeverProvider from '../providers/product_destroy_forever_provider.js';


router.post("/product_store",authenticated, (req,res,next)=>roles(req,res,next,["admin"]), ProductStoreProvider);
router.get("/product" ,   ProductProvider);
router.get("/products",authenticated, (req,res,next)=>roles(req,res,next,["admin"]),  ProductsProvider);
router.post("/product_update/:id",   ProductUpdateProvider);
router.delete("/product_destroy/:id",  ProductDestroyProvider);
router.delete("/product_destroy_forever/:id",   ProductDestroyForeverProvider);


export default router;