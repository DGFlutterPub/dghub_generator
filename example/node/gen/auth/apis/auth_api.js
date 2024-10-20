import express from "express";
const router = express.Router();

import authenticated from '../middleware/api/authenticated.js';
import roles from '../middleware/api/roles.js';
import AuthStoreProvider from '../providers/auth_store_provider.js';
import AuthStoreProvider from '../providers/auth_store_provider.js';


router.post("/auth",AuthStoreProvider);
router.post("/auth",AuthStoreProvider);


export default router;