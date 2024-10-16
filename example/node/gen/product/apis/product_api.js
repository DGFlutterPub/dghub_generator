import express from "express";
const router = express.Router();

import ProductDestroyForeverProvider from '../providers/product_destroy_forever_provider.js';
import ProductDestroyProvider from '../providers/product_destroy_provider.js';
import ProductUpdateProvider from '../providers/product_update_provider.js';
import ProductStoreProvider from '../providers/product_store_provider.js';
import ProductProvider from '../providers/product_provider.js';
import ProductsProvider from '../providers/products_provider.js';


router.delete("/product/:id",ProductDestroyForeverProvider);
router.delete("/product/:id",ProductDestroyProvider);
router.post("/product/:id",ProductUpdateProvider);
router.post("/product",ProductStoreProvider);
router.get("/product/:id",ProductProvider);
router.get("/products",ProductsProvider);


export default router;