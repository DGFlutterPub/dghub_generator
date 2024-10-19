import jwt from "jsonwebtoken";
import Auth from "../../gen/auth/auth.js";

export default async (req, res, next) => {
  console.log("[API] Middleware connected");
  try {
    const token = req.headers.authorization.split(" ")[1];

    const decoded = jwt.verify(token, process.env.JWT_KEY);
    await Auth.findOne({ _id: decoded.id })
      .exec()
      .then(async (data) => {
        console.log("Auth logged");
        if (data.bannedAt != null) {
          return res.status(200).json({
            message: "Banned account",
          });
        }
        if (data.expiredAt != null && data.expiredAt < Date.now()) {
          await Auth.findOneAndUpdate({ _id: data._id }, { expiredAt: null });
        }

        req.auth = data;
        next();
      })
      .catch((err) => {
        return res.status(200).json({
          message: "Authentication failed 1",
        });
      });
  } catch (error) {
    // console.log(error);
    return res.status(200).json({
      message: "Authentication failed 2",
    });
  }
};
