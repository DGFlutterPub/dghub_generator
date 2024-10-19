import Product from '../models/product.js';
 
export default async (req, res, next) => {
  
try{

var search = {$or: [],$and: []};

 search.$and.push({deletedAt: null});
if(req.query.search || req.query.title){
search.$and.push({title: {$regex:req.query.search || req.query.title || '',$options: 'i' }});
}
if(req.query.price){
  search.$and.push({price: req.query.price || null});
  }
  
if(req.query.enabled){
  search.$and.push({enabled: req.query.enabled || null});
  }
  


  var total = await Product.countDocuments(search);
  var page = parseInt(req.query.page) || 1;
  var limit = 20;
  var startIndex = page * limit - limit;

 var data = await Product.find(search)
    .sort("-_id")
    .skip(startIndex)
    .limit(limit, total); 

      return res.status(200).json({
        data: data,
        total: total,
        currentPage: page,
        totalPage: Math.ceil(total / limit),
      });

}catch(e){
 return res.status(200).json('Get all failed');
}


}