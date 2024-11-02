import mongoose from "mongoose";
import populate from "mongoose-autopopulate";


const schema = mongoose.Schema({
  _id: mongoose.Schema.Types.ObjectId,
  deletedAt: { type: Date, default: null },
createdAt: { type: Date, default: Date.now },
updatedAt: { type: Date, default: null },
        title: {
          type: String, 
          default: 'test',
          
        },
      
        price: {
          type: Number, 
          default: null,
          
        },
      
        photo: {
          type: String, 
          default: null,
          
        },
      
        enabled: {
          type: Boolean, 
          default: null,
          
        },
      
        metaData: {
          type: [String], 
          default: [],
          
        },
      

},
{
    timestamps: false,
    versionKey: false,
    toJSON: {
      transform(doc, ret) {
        ret.id = ret._id;
        // delete ret._id;

      },
    },
    toObject: {
      transform(doc, ret) {
        ret.id = ret._id;
      //  delete ret._id;
      },
    },
  });


schema.plugin(populate);

export default mongoose.model("Product", schema);