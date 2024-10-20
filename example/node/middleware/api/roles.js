export default async (req, res, next,role) => {
    try {
      console.log(req.auth.roles);
      if (req.auth.roles.includes(role)) {
        next();
      } else {
        return res.status(200).json({
          message: "You are not "+role,
        });
      }
    } catch (error) {
      console.log(error);
      return res.status(200).json({
        message: role+" middleware error",
      });
    }
  };