import express from "express";
const router = express.Router();

import authenticated from '../middleware/api/authenticated.js';
import roles from '../middleware/api/roles.js';
import ProductStoreProvider from '../providers/product_store_provider.js';
import ProductProvider from '../providers/product_provider.js';
import ProductsProvider from '../providers/products_provider.js';
import ProductUpdateProvider from '../providers/product_update_provider.js';
import ProductDestroyProvider from '../providers/product_destroy_provider.js';
import ProductDestroyForeverProvider from '../providers/product_destroy_forever_provider.js';


router.post("/product",ProductStoreProvider);
router.get("/product/:id",  ProductProvider);
router.get("/products",ProductsProvider);
router.post("/product/:id",ProductUpdateProvider);
router.delete("/product/:id",ProductDestroyProvider);
router.delete("/product/:id",ProductDestroyForeverProvider);


export default router;