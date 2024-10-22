import express from "express";
const router = express.Router();

import authenticated from '../../../middleware/api/authenticated.js';
import roles from '../../../middleware/api/roles.js';
import AuthRegisterProvider from '../providers/auth_register_provider.js';
import AuthLoginProvider from '../providers/auth_login_provider.js';
import AuthForgotPasswordSendProvider from '../providers/auth_forgot_password_send_provider.js';
import AuthForgotPasswordUpdateProvider from '../providers/auth_forgot_password_update_provider.js';
import AuthEmailVerificationSendProvider from '../providers/auth_email_verification_send_provider.js';
import AuthEmailVerificationUpdateProvider from '../providers/auth_email_verification_update_provider.js';


router.post("/auth_register",  AuthRegisterProvider);
router.post("/auth_login",  AuthLoginProvider);
router.post("/auth_forgot_password_send",  AuthForgotPasswordSendProvider);
router.post("/auth_forgot_password_update/:id",   AuthForgotPasswordUpdateProvider);
router.post("/auth_email_verification_send",authenticated,  AuthEmailVerificationSendProvider);
router.post("/auth_email_verification_update/:id", authenticated,  AuthEmailVerificationUpdateProvider);


export default router;