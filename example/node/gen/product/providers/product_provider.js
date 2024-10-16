import Product from '../models/product.js';

export default (req, res, next) => {
  var id = req.params["id"];
  Product.findOne({ _id: id })
    .exec()
    .then((data) => {
   
      return res.json(data);
    })
    .catch((err) => {
      console.log(err);
      return res.status(200).json("This Product is not exists" );
    });
}