import express from "express";
const router = express.Router();

import authenticated from '../../../middleware/api/authenticated.js';
import roles from '../../../middleware/api/roles.js';
import AuthRegisterProvider from '../providers/auth_register_provider.js';
import AuthLoginProvider from '../providers/auth_login_provider.js';


router.post("/auth_register",  AuthRegisterProvider);
router.post("/auth_login",  AuthLoginProvider);


export default router;