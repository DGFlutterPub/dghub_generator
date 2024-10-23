import tools from '../../../system/tools/tools.js';
import Product from '../models/product.js';

export default async (req, res, next) => {
  
   var id = req.params["id"];

   var photo = null;
if(req.files.photo){
 var { error, value } = await tools.fileToStroage(req.files.photo, {
    name: id,
    supports: ["png","jpg","jpeg","gif","webp"],
    path: "product/photo/",
    size: 1000000,
  });

  if (error) {
   return res.status(200).json(value);
  }
   photo = value;
  }



 try{
var data = await Product.findOneAndUpdate(
    {_id: id},
    {title: req.body.title,
price: req.body.price,
photo: req.body.photo,
enabled: req.body.enabled,
metaData: req.body.metaData,
}
  );
 return res.status(200).json(data);
 }catch(e){
  console.log(e);
  return res.status(200).json('Update failed');
 }

}