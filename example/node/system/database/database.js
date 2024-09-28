import mongoose from "mongoose";
import tools from "../tools/tools.js";
import global from "../../config/global.js";

export default () => {

var name = global.packageName.replaceAll('.','_');
var password = global.secertKey;
var host = 'localhost:27017';

var productionUrl = 'mongodb://'+name+':'+password+'@'+host+ '/'+ name;
var developmentUrl = 'mongodb://'+host+ '/'+ name;

//--Mongoose
mongoose
  .connect(global.isDevMode? developmentUrl: productionUrl,{
    //useNewUrlParser: true, 
     //useUnifiedTopology: true, 
     //useCreateIndex: true, 
    // useFindAndModify: false
  })
  .then((result) => {
    tools.log.info("[MONGOOSE_DATABASE] => CONNECTED");
  })
  .catch((e) => {
    tools.log.error(e);
    tools.log.error("[MONGOOSE_DATABASE] => DISCONNECTED");
    return;
  });
return mongoose.Promise = global.Promise;

//Clear Database collection egg: Post to posts

//mongoose.connection.collections.chats.drop(function(){});
}
