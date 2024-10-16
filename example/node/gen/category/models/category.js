import mongoose from "mongoose";
import populate from "mongoose-autopopulate";


const schema = mongoose.Schema({
  _id: mongoose.Schema.Types.ObjectId,
  deletedAt: { type: Date, default: null },
createdAt: { type: Date, default: Date.now },
updatedAt: { type: Date, default: null },
        label: {
          type: String, 
          
          default: null,
          
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

export default mongoose.model("Category", schema);