import express from "express";
import ProductProvider from "../providers/product_provider.js";
import ProductsProvider from "../providers/product_provider.js";

const router = express.Router();

router.get("/product", ProductProvider);
router.get("/products", ProductsProvider);

export default router