export default (req, res, next)=>{
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, Authorization');
    res.setHeader('X-Foo', 'bar');
    //res.setHeader('Content-Type', 'text/plain');
    // res.setHeader('Content-Type', 'application/json'); 
   // res.setHeader('Content-Type', 'multipart/form-data');
    res.setHeader('Access-Control-Allow-Credentials', true);
    
  if(req.method === 'OPTIONS'){
   res.header('Access-Control-Allow-Methods', 'PUT,POST,PATCH,DELETE,GET');
      return res.status(200).send({});
    }
    next();
  }