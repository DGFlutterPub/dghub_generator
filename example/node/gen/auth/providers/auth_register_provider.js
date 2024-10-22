import mongoose from "mongoose";
import tools from '../../../system/tools/tools.js';
import Auth from '../models/auth.js';

export default async (req, res, next) => {

  var id = new mongoose.Types.ObjectId();

  var { error, value } = await tools.createPassword(req.body.password);
  if (error) {
    return res.status(200).json(value);
  }
  var password = value;

  try {
    var data = await new Auth({
      _id: id,
      email: req.body.email,
      password: password,
      token: tools.getToken(id),
    }).save();

    return res.status(200).json(data);
  } catch (e) {
    console.log(e);
    return res.status(200).json('Register failed');
  }

}